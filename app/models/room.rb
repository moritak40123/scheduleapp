class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :schedules, dependent: :destroy
  has_many :candidates, dependent: :destroy

  validates :room_name, presence: true
end
