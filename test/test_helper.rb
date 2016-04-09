require 'simplecov'
SimpleCov.start
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all # don't use fixtures

  # Add more helper methods to be used by all tests here...

  def self.user_hash(valid: true, inserted_value: nil, key: nil)
    valid_hash = { username: Faker::Internet.user_name, email: Faker::Internet.email, password: Faker::Internet.password(8) }
    if valid
      valid_hash
    else
      if key.nil?
        x[x.to_a.sample.flatten.first] = inserted_value # sets a random key in the hash to inserted_value
      else
        x[:key] = inserted_value # sets specific key in the hash to inserted_value
      end
    end
  end



  @@users = {
    valid: [],
    invalid: {
      short_password: [],
      easy_password: [],
      no_password: [],
      dup_username: [],
      no_username: [],
      no_email: [],
      dup_email: []
    }
  }
  50.times do # valid user
    @@users[:valid].push(User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: Faker::Internet.password(8)))
  end

  3.times do # short password
    @@users[:invalid][:short_password].push(User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: Faker::Internet.password(rand(1..7))))
  end

  3.times do # easy password
    @@users[:invalid][:easy_password].push(User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: "baagaaab"))
  end

  3.times do # no password
    @@users[:invalid][:no_password].push(User.create(username: Faker::Internet.user_name, email: Faker::Internet.email))
  end

  3.times do # duplicate username
    @@users[:invalid][:dup_username].push(User.create(username: "Darth_Vader", email: Faker::Internet.email, password: Faker::Internet.password(8)))
  end

  3.times do # no username
    @@users[:invalid][:no_username].push(User.create(email: Faker::Internet.email, password: Faker::Internet.password(8)))
  end

  3.times do # duplicate email
    @@users[:invalid][:dup_email].push(User.create(username: Faker::Internet.user_name, email: "wombat@wombat.com", password: Faker::Internet.password(8)))
  end

  3.times do # no email
    @@users[:invalid][:no_email].push(User.create(username: Faker::Internet.user_name, password: Faker::Internet.password(8)))
  end

  @@valid_user = @@users[:valid].sample # a random valid user

  # Establishing follows
  @users = User.all
  @user = User.first
  @following = @users[2..50]
  @followers = @users[3..40]
  @following.each { |followed| @user.follow!(followed) }
  @followers.each { |follower| follower.follow!(@user) }

  # Making ships
  @users.each do |u|
    rand(1..5).times do
      u.ships.create!(body: Faker::Lorem.sentence(2))
    end
  end

end
