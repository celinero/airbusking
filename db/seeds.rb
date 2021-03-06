# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

genres = [
  {name: "Singer", description: "Folk, rock, pop, blues and jazz, R&B, hip hop, classical"},
  {name: "Musician", description: "Rock, pop, blues and jazz, R&B, hip hop, classical"},
  {name: "Dancer", description: "Hip hop, funk, breakdance, done by individual or by group"},
  {name: "Magician", description: "Illusion by sleight of hand or deceptive devices"},
  {name: "Mime", description: "Silent art that involves acting using only movements, gestures, and facial expressions"},
  {name: "Puppeteer", description: "Entertainer manipulating a puppet"},
  {name: "Living statue artist", description: "A character with costume and make up, that perform a statue and interact with his audience "},
  {name: "Pavement art", description: "Chalk artist, painter"},
  {name: "Street theatre", description: "Dramatization of social and political issues played outdoors"},
  {name: "Comedians", description: "Stand up performers or Joke busker"},
  {name: "Circus skills", description: "Fire manipulation, juggling, acrobatics etc..."}
]

if Genre.count == 0
  genres.each do |genre|
    Genre.create(name: genre[:name], description: genre[:description])
    puts "Created #{genre[:name]} genre"
  end
end

if User.count == 0
  User.create(username: "Bob Marley", email: "bob@marley.com", password: "password", password_confirmation: "password")
  User.create(username: "Jacky Chan", email: "jacky@chan.com", password: "password", password_confirmation: "password")
  User.create(username: "Taylor Swift", email: "taylor@swift.com", password: "password", password_confirmation: "password")
  User.create(username: "John Doe", email: "john@doe.com", password: "password", password_confirmation: "password")
end

if BuskerProfile.count == 0
  BuskerProfile.create(user_id: 1, name: "Jamaica Love", bio: "lorem ipsum")
  BuskerProfile.create(user_id: 3, name: "Country Girl", bio: "lorem ipsum")
end