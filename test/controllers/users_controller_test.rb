require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  skip
  test "should show user" do
    user = users(:user1)
    get :show, id: user.id
    assert assigns(:user)
    assert_response :success
  end
end
