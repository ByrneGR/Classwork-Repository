# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.delete_all
Bench.delete_all

10.times do
  User.create(username: Faker::Games::LeagueOfLegends.unique.champion, password: "legolas")
end  

Bench.create(description: "corbett", lat: 37.756223 , lng: -122.443151)
Bench.create(description: "limon", lat: 37.756617, lng: -122.416465)
