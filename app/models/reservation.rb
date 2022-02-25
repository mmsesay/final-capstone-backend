class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :duration, presence: true
  validates :car, presence: true, :on => :create
  validates :user, presence: true, :on => :create
end
