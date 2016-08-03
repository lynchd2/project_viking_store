class Product < ActiveRecord::Base
  
  def self.from_seven_days
    Product.joins("JOIN order_contents ON order_contents.product_id = products.id").joins('JOIN orders ON order_contents.order_id = orders.id').where('orders.checkout_date > ?', 7.days.ago).sum('quantity * price')
  end
end
