class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  before_save :set_total_price


  def set_total_price
    end_date - start_date * self.space.price_per_hour
  end
end
