# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




User.destroy_all
Band.destroy_all
Album.destroy_all
Track.destroy_all


users = []
10.times do
  users << User.create!(email: Faker::Internet.safe_email, password: "password")
end

bands = []
10.times do
  bands << Band.create!(name: Faker::RockBand.name)
end

albums = []
20.times do
  albums << Album.create!(band_id: bands.sample.id, name: Faker::Superhero.power)
end

tracks = []
50.times do
  tracks << Track.create!(album_id: albums.sample.id, name: Faker::Superhero.descripto)
end
