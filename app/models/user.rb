class User < ActiveRecord::Base
  def self.count_users_in_days(n)
    User.where('created_at > ?',n.days.ago).count
  end

  def self.highest_order_value
    User.joins("JOIN orders ON users.id = orders.user_id").joins("JOIN order_contents ON orders.id = order_contents.order_id").joins("JOIN products ON products.id = order_contents.product_id").group("order_contents.order_id").sum('(products.price * order_contents.quantity)')
  end
end


#Highest single order value -> User, Order, Ordecontents, Product
#Highest Lifetime value
#Highest Average order value
#Most Orders Places