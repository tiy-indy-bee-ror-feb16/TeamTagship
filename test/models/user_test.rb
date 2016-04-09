require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # For testing User model. Class tweaked to allow for both one-time setup and teardown as well as between-test setup and teardown.
  class << self
    def startup
    end
    def shutdown
      puts 'runs only once at end'
    end
    def suite
      mysuite = super
      def mysuite.run(*args)
        MyTest.startup()
        super
        MyTest.shutdown()
      end
      mysuite
    end
  end

  def setup
    @users = []
    100.times do |n|
      @users.push(instance_variable_set("@user#{n}", User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: Faker::Internet.password)))
    end
  end

  def teardown
    puts 'runs after each test'
  end


  test "validates email presence" do
    @user1.email = nil
    refute @user1.valid?, "#{@user1.username}'s e-mail was not validated for presence"
  end

  test "validates email uniqueness" do
    @user1.email = @user2.email
    refute @user1.valid?, "#{@user1.username}'s e-mail was not validated for uniqueness"
  end

  test "validates user password is at least eight characters long" do
    refute @user1.valid? , "#{@user1.username}'s password was not validated for length"
  end

  test "validates user password contains at least four unique characters" do

  end

end



# http://stackoverflow.com/questions/255969/in-rubys-testunittestcase-how-do-i-override-the-initialize-method
#
# class MyTest < Test::Unit::TestCase
#     class << self
#         def startup
#             puts 'runs only once at start'
#         end
#         def shutdown
#             puts 'runs only once at end'
#         end
#         def suite
#             mysuite = super
#             def mysuite.run(*args)
#               MyTest.startup()
#               super
#               MyTest.shutdown()
#             end
#             mysuite
#         end
#     end
#
#     def setup
#         puts 'runs before each test'
#     end
#     def teardown
#         puts 'runs after each test'
#     end
#     def test_stuff
#         assert(true)
#     end
# end
