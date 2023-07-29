class Candidate < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
