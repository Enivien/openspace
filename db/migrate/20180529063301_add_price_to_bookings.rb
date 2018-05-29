class AddPriceToBookings < ActiveRecord::Migration[5.2]
  def change
    add_monetize :bookings, :amount, currency: { present: false }
    remove_column :bookings, :total_price
  end
end
