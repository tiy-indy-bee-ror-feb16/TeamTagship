require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user1 = users(:user1)
    @user2 = users(:user2)
  end

  test "validates email presence" do
    @user1.email = nil
    refute @user1.valid?, "#{@user1.username}'s e-mail was not validated for presence"
  end

  test "validates email uniqueness" do
    @user1.email = @user2.email
    refute @user1.valid?, "#{@user1.username}'s e-mail was not validated for uniqueness"
  end
end
