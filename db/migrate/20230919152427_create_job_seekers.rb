class CreateJobSeekers < ActiveRecord::Migration[7.0]
  def change
    create_table :job_seekers do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :contact
      t.timestamps
    end
  end
end
