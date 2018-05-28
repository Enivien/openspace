class AddAttributesToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :guest, :integer
  end
end
