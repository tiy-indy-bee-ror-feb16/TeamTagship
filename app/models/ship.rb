class Ship < ActiveRecord::Base
  belongs_to :user

  def self.timeline(user)
    following_ids = user.followees(User, pluck: :id)
    all_ids= following_ids << user.id
    Ship.where(user_id: all_ids).order("created_at DESC")
  end

end
