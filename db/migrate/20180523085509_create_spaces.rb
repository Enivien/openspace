class CreateSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :spaces do |t|
      t.integer :capacity
      t.integer :price_per_hour
      t.integer :size
      t.integer :restroom
      t.integer :room
      t.string :location
      t.string :picture
      t.string :name
      t.text :description
      t.references :amenity, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
