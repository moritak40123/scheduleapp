class CreateCandidateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :candidate_schedules do |t|

      t.timestamps
    end
  end
end
