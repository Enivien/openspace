class Space < ApplicationRecord
  # mount_uploader :picture, PhotoUploader
  has_attachments :pictures, maximum: 10

  has_one :amenity
  belongs_to :user
  has_many :reviews
  has_many :favorites

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
