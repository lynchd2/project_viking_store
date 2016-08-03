class User < ActiveRecord::Base
  def self.count_users_in_days(n)
    User.where('created_at > ?',n.days.ago).count
  end
end
