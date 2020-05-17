# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
    name: "RAD",
    email: "RAD@rad.com",
    password: "Rails2020",
    password_confirmation: "Rails2020",
    mobile_number: "123456789"
)

User.create!(name: "s3714954",
             email: "1201wah@gmail.com",
             password: "gundum1234",
             password_confirmation: "gundum1234",
             mobile_number: "+61-123456789",
             admin: true)

99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    mobile_number = "+61-#{n+1}"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password,
                 mobile_number: mobile_number)
end