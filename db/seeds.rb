# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do
  begin
    User.create!(
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password(8)
    )
  rescue
    User.create!(
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password(8)
    )
  end
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow!(followed) }
followers.each { |follower| follower.follow!(user) }

# Ships
users = User.all
20.times do
  users.each { |u| u.ships.create!(body: Faker::Lorem.sentence(2)) }
end
