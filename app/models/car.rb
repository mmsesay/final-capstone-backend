class Car < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_one_attached :image

  validates :user_id, presence: true
  validates :decription, presence: true
  validates :model_info, presence: true
  validates :name, presence: true
  validates :image, presence: true
  validates :reservation_fee, presence: true
end
