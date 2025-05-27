require 'faker'

User.create!(
  name:  "Example User",
  email: "example1@tol.com",
  password:              "testtest",
  password_confirmation: "testtest",
  admin: true,
  activated: true,
  activated_at: Time.zone.now
)

99.times do |n|
  name  = Faker::Name.name
  email = "user-#{n+1}@tol.com"
  password = "password"
  User.create!(
    name:  name,
    email: email,
    password:              password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now
  )
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end

users = User.all
user  = users.first
following = users[2..50]     # User 1 follows users 3 through 51
followers = users[3..40]     # Users 4 through 41 follow User 1
following.each  { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
