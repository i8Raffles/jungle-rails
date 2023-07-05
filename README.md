# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

## Features
- Admins can login to view a list of all plants and categories, add new plants and categories to the application.
- On the home page, all users can view a list of all the plants/trees and view them by categories. Clicking on a product will take the user to that specific product page with information about that plant's description, price and quantity available.
- Users can also register, login and add plants to cart should they want to purchase them. Purchasing functionality has been implemented with Stripe.

## Screenshots

![Jungle - HomePage](https://github.com/i8Raffles/jungle-rails/blob/master/docs/home_page.PNG?raw=true)

![Jungle - Cart](https://github.com/i8Raffles/jungle-rails/blob/master/docs/cart_page.PNG?raw=true)

![Jungle - Category](https://github.com/i8Raffles/jungle-rails/blob/master/docs/category_page.PNG?raw=true)

![Jungle - SingleProduct](https://github.com/i8Raffles/jungle-rails/blob/master/docs/single_product.PNG?raw=true)

![Jungle - AdminProducts](https://github.com/i8Raffles/jungle-rails/blob/master/docs/admin_products.PNG?raw=true)


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
