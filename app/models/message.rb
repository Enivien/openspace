class Message < ApplicationRecord
  belongs_to :user
  belongs_to :space
  has_many :replies
end
