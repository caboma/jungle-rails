class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["username"],
                               password: ENV["password"],
                               if: -> { ENV["password"].present? }
  
  def show
    @products = Product.count
    @categories = Category.count
  end
end
