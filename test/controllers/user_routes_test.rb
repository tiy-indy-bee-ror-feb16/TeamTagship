class UserRoutesTest < ActionController::TestCase
  test "should route to user" do
    assert_routing({ method: 'get', path: '/users/1'}, { controller: "users", action: "show", id: "1" })
  end

  test "should route to create user" do
    assert_routing({ method: 'post', path: '/users' }, { controller: "users", action: "create" })
  end
end
