class Candidate < ApplicationRecord
  belongs_to :room
  belongs_to :user
  # has_many :candidate_schedules, dependent: :destroy
  # accepts_nested_attributes_for :candidate_schedules, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
