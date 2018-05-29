class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  has_one :activity, through: :space
  before_save :set_amount
  has_many :reviews, dependent: :destroy
  monetize :amount_cents

  def set_amount
   time = (end_time - start_time) / 3600
   return time * self.space.price_per_hour
  end
end
