class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.boolean :offsite_meeting
      t.boolean :workshop
      t.boolean :photo_shoot
      t.boolean :film_shoot
      t.boolean :corporate_event
      t.boolean :office_party
      t.boolean :product_launch

      t.timestamps
    end
  end
end
