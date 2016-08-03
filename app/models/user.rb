class User < ActiveRecord::Base
  def self.count_users_in_days(n)
    User.where('created_at > ?',n.days.ago).count
  end

  def user_orders_ordercontents_products
    joins("JOIN orders ON users.id = orders.user_id").joins("JOIN order_contents ON orders.id = order_contents.order_id").joins("JOIN products ON products.id = order_contents.product_id")
  end

  def self.highest_order_value # 4686.86
    User.select('users.first_name, users.last_name, sum(products.price * order_contents.quantity)as total').
    joins("JOIN orders ON users.id = orders.user_id").
    joins("JOIN order_contents ON orders.id = order_contents.order_id").
    joins("JOIN products ON products.id = order_contents.product_id").
    group("order_contents.order_id, users.id").
    order('total desc').
    limit(1)
  end

  def self.highest_lifetime_value #13817.96
    User.joins("JOIN orders ON users.id = orders.user_id").
    joins("JOIN order_contents ON orders.id = order_contents.order_id").
    joins("JOIN products ON products.id = order_contents.product_id").
    group('users.id').
    select('users.first_name, users.last_name, sum(products.price * order_contents.quantity)as total').
    order('total desc').
    limit(1)
  end
end


#Highest single order value -> User, Order, Ordecontents, Product
#Highest Lifetime value
#Highest Average order value
#Most Orders Places
