class User < ActiveRecord::Base
  acts_as_follower
  acts_as_followable
  has_many :ships
  has_secure_password
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
  validates :password, length: { minimum: 8, maximum: 20 }, on: :create
end
