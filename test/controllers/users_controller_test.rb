require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "should show user" do
    get :show, id: @@valid_user.id
    assert assigns(:user)
    assert_response :success
  end

end
