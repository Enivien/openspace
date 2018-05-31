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

4.times do
 space = Space.new(
   name: Faker::HarryPotter.house,
   location: Faker::HarryPotter.location,
   capacity: (10..100).to_a.sample,
   restroom: (1..3).to_a.sample,
   room: (1..5).to_a.sample,
   price_per_hour: (100..1000).to_a.sample,
   user_id: 1,
   description: Faker::Lorem.sentence(4),
   latitude: Faker::Address.latitude,
   longitude: Faker::Address.longitude
   )
 space.picture_urls = %w[ https://picsum.photos/1280/700/?random
 https://picsum.photos/1280/700/?random https://picsum.photos/1280/700/?random
  ]
 space.save!
 p space.name

 amenity = Amenity.new(
  wifi: true,
  airco: true,
  elevator: true,
  space_id: space.id
  )
 amenity.save!

 @activity = Activity.new(
  offsite_meeting: true,
  product_launch: true,
  film_shoot: true,
  space_id: space.id
  )
 @activity.save!
end

Booking.destroy_all

3.times do
 booking = Booking.new(
   start_time: Faker::Date.between(4.days.ago, Date.today),
   end_time: Date.today,
   amount_cents: (1..6000).to_a.sample,
   booked_activity: "offsite_meeting",
   user_id: User.all.sample.id,
   space_id: Space.all.sample.id,
   )
 booking.save!
 p booking.amount_cents
end
