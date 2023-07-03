require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be created with a password and password_confirmation fields' do
      user = User.new(
        email: 'test@example.com',
        name: 'Mary Jane',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to be_valid
    end

    it 'should have matching password and password_confirmation fields' do
      user = User.new(
        email: 'test@example.com',
        name: 'Mary Jane',
        password: 'password',
        password_confirmation: 'different_password'
      )
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should be invalid without password and password_confirmation' do
      user = User.new(
        email: 'test@example.com',
        name: 'Mary Jane'
      )
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'should have a unique email (case-insensitive)' do
      user1 = User.create(
        email: 'test@example.com',
        name: 'Mary Jane',
        password: 'password',
        password_confirmation: 'password'
      )
      user2 = User.new(
        email: 'TEST@example.com',
        name: 'Mary Jane',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user2).not_to be_valid
      expect(user2.errors.full_messages).to include('Email has already been taken')
    end

    it 'should be invalid without email and name' do
      user = User.new(
        email: nil,
        name: nil,
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Email can't be blank")
      expect(user.errors.full_messages).to include("Name can't be blank")
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should return user if email and password match' do
      user = User.create(
        email: 'test@example.com',
        name: 'Mary Jane',
        password: 'password',
        password_confirmation: 'password'
      )
      authenticated_user = User.authenticate_with_credentials('test@example.com', 'password')
      expect(authenticated_user).to eq(user)
    end
  
    it 'should return nil if email and password do not match' do
      user = User.create(
        email: 'test@example.com',
        name: 'Mary Jane',
        password: 'password',
        password_confirmation: 'password'
      )
      authenticated_user = User.authenticate_with_credentials('test@example.com', 'wrong_password')
      expect(authenticated_user).to be_nil
    end
  
    it 'should return nil if email does not exist' do
      authenticated_user = User.authenticate_with_credentials('nonexistent@example.com', 'password')
      expect(authenticated_user).to be_nil
    end
  
    it 'should ignore leading/trailing whitespaces in email' do
      user = User.create(
        email: 'test@example.com',
        name: 'Mary Jane',
        password: 'password',
        password_confirmation: 'password'
      )
      authenticated_user = User.authenticate_with_credentials('  test@example.com  ', 'password')
      expect(authenticated_user).to eq(user)
    end
  
    it 'should be case-insensitive for email' do
      user = User.create(
        email: 'test@example.com',
        name: 'Mary Jane',
        password: 'password',
        password_confirmation: 'password'
      )
      authenticated_user = User.authenticate_with_credentials('TEST@example.com', 'password')
      expect(authenticated_user).to eq(user)
    end
  end
end
