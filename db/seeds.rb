# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

n = 1
while n <= 10
  content = Faker::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  name = Faker::Name.name
  Topic.create(
    content: content,
    user_id: n
  )
  User.create(email: email,
              password: password,
              password_confirmation: password,
              name: name
              )
  n = n + 1
end
