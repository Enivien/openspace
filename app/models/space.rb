class Space < ApplicationRecord
  # mount_uploader :picture, PhotoUploader
  has_attachments :pictures, maximum: 10

  has_one :amenity
  has_one :activity
  belongs_to :user
  has_many :reviews
  has_many :favorites
  has_many :bookings

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def user_favorited?(user)
    Favorite.find_by(user_id: user.id, space_id: self.id)
  end

  def activities
    activities = self.activity

    activities.attributes.select do |key, value|
      key if value == true
    end.keys
  end
end
