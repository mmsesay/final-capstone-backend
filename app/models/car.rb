class Car < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :user_id, presence: true
  validates :name, presence: true
  validates :image, presence: true
  validates :price, presence: true
  validates :duration, presence: true
  validates :reservation_fee, presence: true
  validates :number_of_seats, presence: true
end
