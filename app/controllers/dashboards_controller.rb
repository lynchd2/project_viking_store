class DashboardsController < ApplicationController

  def index
    @user_count = User.where('created_at > ?',7.days.ago).count
    @order_count = Order.where('checkout_date > ?',7.days.ago).count
    @new_products = Product.where('created_at > ?',7.days.ago).count
    @revenue = Product.find_by_sql("
      SELECT (quantity * price) as order_total
      from order_contents oc 
      INNER JOIN products p on order_id = oc.id
      limit 1

      ")
     


  end
end

