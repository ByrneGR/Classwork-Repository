# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Sub.delete_all

10.times do
    User.create(username: Faker::Movies::LordOfTheRings.unique.character, password: "password")
end

10.times do 
    Sub.create(title: Faker::Restaurant.name, description: Faker::Restaurant.description, moderator_id: (31..40).to_a.sample)
end    