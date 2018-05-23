class CreateAmenities < ActiveRecord::Migration[5.2]
  def change
    create_table :amenities do |t|
      t.boolean :offsite_meeting
      t.boolean :workshop
      t.boolean :photo_shoot
      t.boolean :film_shoot
      t.boolean :corporate_event
      t.boolean :office_party
      t.boolean :product_launch
      t.boolean :on_site_parking
      t.boolean :wheelchair_access
      t.boolean :airco
      t.boolean :elevator
      t.boolean :natural_light
      t.boolean :whiteboard
      t.boolean :kitchen
      t.boolean :projector
      t.boolean :wifi

      t.timestamps
    end
  end
end
