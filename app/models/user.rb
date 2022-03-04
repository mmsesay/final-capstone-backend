class User < ApplicationRecord
  validates :username, uniqueness: true
end
