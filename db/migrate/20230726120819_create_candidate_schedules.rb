class CreateCandidateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :candidate_schedules do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :candidate, foreign_key: true

      t.timestamps
    end
  end
end
