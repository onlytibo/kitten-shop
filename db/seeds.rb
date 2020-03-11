# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Item.destroy_all

User.create(
  email: "user@yopmail.com",
  password: "123456",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name
)
puts "User 1"

User.create(
  email: "user2@yopmail.com",
  password: "123456",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name
)
puts "User 2"
#admin
User.create(
  email: "bojuaugustin44@gmail.com",
  password: "123456",
  first_name: "Augustin",
  last_name: "Boju ADMIN",
  is_admin: true
)
puts "ADMIN created"

i = 1;
20.times do
  Item.create(
    name: Faker::DcComics.hero,
    description: "Procedente igitur mox tempore cum adventicium nihil inveniretur.",
    price: rand(5..30),
  )
  puts "Item #{i} created"
  i += 1;
end
