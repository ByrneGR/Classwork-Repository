# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Artwork.delete_all
ArtworkShare.delete_all
users = User.create!([{username: 'jonathansu'}, {username: 'milliehe'}, {username: 'austinwong'}])
artworks = Artwork.create!([{title: 'Starry Night', image_url: 'https://www.moma.org/media/W1siZiIsIjQ2NzUxNyJdLFsicCIsImNvbnZlcnQiLCItcXVhbGl0eSA5MCAtcmVzaXplIDIwMDB4MjAwMFx1MDAzZSJdXQ.jpg?sha=314ebf8cc678676f',
artist_id: users.first.id}, {title: 'Sleeping Gypsy', image_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Henri_Rousseau_010.jpg/300px-Henri_Rousseau_010.jpg', artist_id: users.second.id }, 
{title: 'Broadway Boogie Woogie', image_url: 'https://uploads3.wikiart.org/images/piet-mondrian/broadway-boogie-woogie-1943.jpg!Large.jpg', 
artist_id: users.third.id}])
artwork_shares = ArtworkShare.create!([{artwork_id: artworks.third.id, viewer_id: users.first.id}, {artwork_id: artworks.second.id, viewer_id: users.second.id}, {artwork_id: artworks.first.id, viewer_id: users.third.id}])