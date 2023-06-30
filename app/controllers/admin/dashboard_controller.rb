class Admin::DashboardController < ApplicationController
  def show
    @Products = Product.all
    @Categories = Category.all
  end
end
