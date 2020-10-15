class Room < ApplicationRecord
  has_many :romm_users
  has_many :users, through: :room_users
end
