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
  encrypted_password: "123456",
  name: Faker::Name.last_name
)
puts "User 1"

User.create(
  email: "user2@yopmail.com",
  encrypted_password: "123456",
  name: Faker::Name.last_name
)
puts "User 2"

i = 1;
20.times do
  Item.create(
    title: Faker::Name.first_name,
    description: "Procedente igitur mox tempore cum adventicium nihil inveniretur, relicta ora maritima in Lycaoniam adnexam Isauriae se contulerunt ibique densis intersaepientes itinera praetenturis provincialium et viatorum opibus pascebantur.",
    price: rand(5..30),
    image_url: "http://placehold.it/900x350",
  )
  puts "Item #{i} created"
  i += 1;
end
