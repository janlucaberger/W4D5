# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

IMAGE_TYPES = [
  "abstract",
  "animals",
  "city",
  "people",
  "food",
  "fashion",
  "nightlife",
  "technics",
  "nature",
  "sports"
]


User.destroy_all
Band.destroy_all
Album.destroy_all
Track.destroy_all


users = []
10.times do
  users << User.create!(email: Faker::Internet.safe_email, password: "password")
end
User.create!(email: "test@gmail.com", password: "password")


bands = []
10.times do
  bands << Band.create!(name: Faker::RockBand.name)
end

type = ["LIVE", "STUDIO"]
albums = []
20.times do
  albums << Album.create!(band_id: bands.sample.id, name: Faker::Superhero.power, rec_type: type.sample, image: Faker::LoremPixel.image("400x400", false, IMAGE_TYPES.sample))
end

tracks = []
50.times do
  tracks << Track.create!(album_id: albums.sample.id, name: Faker::Superhero.descriptor, lyrics: Faker::Lorem.sentence(rand(50..100)))
end
