class Order < ActiveRecord::Base
  def self.count_orders_in_days(n)
    Order.where('checkout_date > ?',n.days.ago).count
  end
end
