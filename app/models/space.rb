class Space < ApplicationRecord
  belongs_to :amenity
  belongs_to :user
  has_many :reviews
  has_many :favorites
end
