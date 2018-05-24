# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Space.create(
  name: "Nice thing",
  capacity: 4,
  price_per_hour: 400,
  size: 500,
  restroom: 3,
  room: 4,
  location: 'Australia',
  description: 'So f-ing nice',
  user_id: 1
  )



  # create_table "spaces", force: :cascade do |t|
  #   t.integer "capacity"
  #   t.integer "price_per_hour"
  #   t.integer "size"
  #   t.integer "restroom"
  #   t.integer "room"
  #   t.string "location"
  #   t.string "picture"
  #   t.string "name"
  #   t.text "description"
  #   t.bigint "amenity_id"
  #   t.bigint "user_id"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.index ["amenity_id"], name: "index_spaces_on_amenity_id"
  #   t.index ["user_id"], name: "index_spaces_on_user_id"
  # end

  #   create_table "amenities", force: :cascade do |t|
  #   t.boolean "offsite_meeting"
  #   t.boolean "workshop"
  #   t.boolean "photo_shoot"
  #   t.boolean "film_shoot"
  #   t.boolean "corporate_event"
  #   t.boolean "office_party"
  #   t.boolean "product_launch"
  #   t.boolean "on_site_parking"
  #   t.boolean "wheelchair_access"
  #   t.boolean "airco"
  #   t.boolean "elevator"
  #   t.boolean "natural_light"
  #   t.boolean "whiteboard"
  #   t.boolean "kitchen"
  #   t.boolean "projector"
  #   t.boolean "wifi"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  # end
