class Space < ApplicationRecord
  has_one :amenity
  belongs_to :user
  has_many :reviews
  has_many :favorites

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
