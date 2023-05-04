class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']

  #Display a count of how many products are in the database
  #Display a count of how many categories are in the database
  
  def show
    @totalproducts = Product.count
    @totalcategories = Category.count
  end

end