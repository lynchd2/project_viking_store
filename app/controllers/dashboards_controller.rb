class DashboardsController < ApplicationController

  def index
    @user_count = User.count
    @order_count = Order.count
    @orders_submitted=Order.select('count(checkout_date)')
    @products = Product.count
    @revenue = 


  end
end
