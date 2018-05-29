# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do
 User.create(
   first_name: Faker::Name.first_name,
   last_name: Faker::Name.last_name,
   email: Faker::Internet.email,
   password: Faker::Internet.password(8),
   bio: Faker::ChuckNorris.fact,
   avatar: Faker::Avatar.image("my-own-slug", "50x50")
   )
end

Space.destroy_all

10.times do
 space = Space.new(
   name: Faker::HarryPotter.house,
   location: Faker::HarryPotter.location,
   capacity: (10..100).to_a.sample,
   restroom: (1..3).to_a.sample,
   room: (1..5).to_a.sample,
   price_per_hour: (100..1000).to_a.sample,
   user_id: 1,
   description: Faker::Lorem.sentence(4),
   picture: "https://picsum.photos/200/300/?random",
   activity_id: 1
   )
 space.save!
 p space.name
end

Booking.destroy_all

3.times do
 booking = Booking.new(
   start_time: Faker::Date.between(4.days.ago, Date.today),
   end_time: Date.today,
   total_price: 600,
   user_id: 1,
   space_id: 1,
   )
 booking.save!
 p booking.total_price
end
