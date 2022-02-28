class Reservation < ApplicationRecord
  belongs_to :car

  validates :duration, presence: true
  validates :car, presence: true, :on => :create
end
