require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # For testing User model. Class tweaked to allow for both one-time setup and teardown as well as between-test setup and teardown.

  def setup
    @valid_user = @@users[:valid].sample
  end

  def teardown
    # puts 'runs after each test'
  end


  test "validates email presence" do
    @user = @@users[:invalid][:no_email].sample
    refute @user.valid?, "#{@user.username}'s e-mail was not validated for presence"
  end

  test "validates email uniqueness" do
    @user = @@users[:invalid][:dup_email].sample
    refute @user.valid?, "#{@user.username}'s e-mail was not validated for uniqueness"
  end

  test "validates user password is at least eight characters long" do
    @user = @@users[:invalid][:short_password].sample
    refute @user.valid? , "#{@user.username}'s password was not validated for length"
  end

  test "validates user password contains at least four unique characters" do
    # skip # this one makes Ruby explode atm
    @user = @@users[:invalid][:easy_password].sample
    refute @user.valid?, "#{@user.username}'s password was not validated for a minimum of four unique characters"
  end

end
