require 'test_helper'

class ShipsControllerTest < ActionController::TestCase

  test "should show ship" do
    skip
    ship = ships(:ship1)
    get :show, id: ship.id
    assert assigns(:ship)
    assert_response :success
  end

end
