require 'faker'

User.create!(name:  "Example User",
             email: "example1@tol.com",
             password:              "testtest",
             password_confirmation: "testtest",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "user-#{n+1}@tol.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
