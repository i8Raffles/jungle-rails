require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.create(name: "Testing")
    end

    it 'should save successfully when all fields are set' do
      @product = @category.products.create(
        name: 'Test product',
        price_cents: 149,
        quantity: 33
      )
      expect(@product).to be_valid
    end

    it 'should not save when name is nil' do
      @product = Product.create(
        name: nil,
        price_cents: 1659,
        quantity: 223
      )
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not save when quantity is nil' do
      @product = Product.create(
        name: 'Some item',
        price_cents: 420,
        quantity: nil
      )
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should not save when category is nil' do
      @product = Product.create(
        name: 'Test product',
        price_cents: 200,
        quantity: 1,
        category: nil
      )
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end  

    it 'should not save when price is nil' do
      @product = Product.create(
        name: 'Another item',
        price_cents: nil,
        quantity: 23,
        category: @category
      )
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
  end
end
