class DashboardsController < ApplicationController

  def index
    @user_count7 = User.count_users_in_days(7)
    @order_count7 = Order.count_orders_in_days(7)
    @new_products7 = Product.count_products_in_days(7)
    @revenue7 = Product.from_days(7)

    @user_count30 = User.count_users_in_days(30)
    @order_count30 = Order.count_orders_in_days(30)
    @new_products30 = Product.count_products_in_days(30)
    @revenue30 = Product.from_days(30)

    @user_count = User.count
    @order_count = Order.count
    @new_products = Product.count
    @revenue = Product.total_revenue

    @top_states = User.joins("JOIN addresses ON users.billing_id = addresses.id").joins("JOIN states ON states.id = addresses.state_id").group('states.name').order('sum(states.id) desc').limit(3).count('state_id')
    @top_cities = User.joins("JOIN addresses ON users.billing_id = addresses.id").joins("JOIN cities ON cities.id = addresses.city_id").group('cities.name').order('sum(cities.id) desc').limit(3).count('city_id')



  end
end



