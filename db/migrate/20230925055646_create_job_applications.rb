# frozen_string_literal: true

class CreateJobApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :job_applications do |t|
      t.references :job_seeker, null: false, foreign_key: true
      t.references :job_posting, null: false, foreign_key: true
      t.text :cover_letter

      t.timestamps
    end
  end
end
