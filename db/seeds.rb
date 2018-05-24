# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
