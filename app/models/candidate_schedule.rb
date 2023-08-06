class CandidateSchedule < ApplicationRecord
  belongs_to :candidate
  validates :start_time, presence: true
  validates :end_time, presence: true
end
