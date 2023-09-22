class CreateJobPostings < ActiveRecord::Migration[7.0]
  def change
    create_table :job_postings do |t|
      t.string :title
      t.string :company_name
      t.text :description
      t.string :location
      t.decimal :salary
      t.text :qualifications
      t.text :application_instructions
      t.references :company_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
