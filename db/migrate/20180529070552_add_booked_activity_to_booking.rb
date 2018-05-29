class AddBookedActivityToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :booked_activity, :string
  end
end
