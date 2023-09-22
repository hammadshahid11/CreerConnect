class CreateSavedJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :saved_jobs do |t|
      t.references :job_seeker, null: false, foreign_key: true
      t.references :job_posting, null: false, foreign_key: true
      t.datetime :date_saved

      t.timestamps
    end
  end
end
