class User < ActiveRecord::Base
  acts_as_follower
  acts_as_followable
  has_many :ships
  has_secure_password

end
