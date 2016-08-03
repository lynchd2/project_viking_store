class DashboardsController < ApplicationController

  def index
    @user_count = User.where('created_at > ?',7.days.ago).count
    @order_count = Order.where('checkout_date > ?',7.days.ago).count
    @new_products = Product.where('created_at > ?',1.days.ago).count
    # @revenue = Product.find_by_sql("
    #   SELECT SUM(quantity * price) as order_total
    #   FROM order_contents
    #   INNER JOIN products ON order_contents.product_id = products.id
    #   ")
    @revenue = Product.from_seven_days



  end
end



