class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.time :start_time
      t.time :end_time
      t.integer :total_price
      t.boolean :status
      t.references :user, foreign_key: true
      t.references :space, foreign_key: true

      t.timestamps
    end
  end
end
