module ShipsHelper

  def no_timeline(user)
    user.followees_count == 0
  end

end
