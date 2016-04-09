require 'test_helper'

class ShipTest < ActiveSupport::TestCase

  test "validates ship length is less than 170 characters" do
    @ship = @@valid_user.ships.create(body: Faker::Lorem.paragraph(5))
    refute @ship.valid?, "#{@@valid_user.username}'s tweet was not validated for being less than 170 characters"
  end


end
