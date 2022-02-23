class User < ApplicationRecord
  has_many :cars
  has_many :reservations, dependent: :destroy

  validates :username, uniqueness: true
end
