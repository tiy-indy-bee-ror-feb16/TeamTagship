# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do
  User.create!(
  username: Faker::StarWars.character,
  email: Faker::Internet.safe_email,
  password: Faker::Internet.password(8)
  )

  User.all
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow!(followed) }
followers.each { |follower| follower.follow!(user) }

# Ships
users = User.order(:created_at).take(50)
20.times do
  content = Faker::Lorem.sentence(1)
  users.each { |u| u.ships.create!(body: content) }
end
