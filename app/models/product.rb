class Product < ActiveRecord::Base

  def self.from_days(n)
    Product.joins("JOIN order_contents ON order_contents.product_id = products.id").joins('JOIN orders ON order_contents.order_id = orders.id').where('orders.checkout_date > ?', n.days.ago).sum('quantity * price')
  end
  def self.count_products_in_days(n)
    Product.where('created_at > ?',n.days.ago).count
  end

  def self.total_revenue
    Product.joins("JOIN order_contents ON order_contents.product_id = products.id").joins('JOIN orders ON order_contents.order_id = orders.id').sum('quantity * price')
  end
end
