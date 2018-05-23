class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :spaces
  has_many :favorites
  has_many :bookings
  has_many :messages
  has_many :conversations through: :messages
  has_many :spaces through: :favorites
end

