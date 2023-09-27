class AddStatusToJobPostings < ActiveRecord::Migration[7.0]
  def change
    add_column :job_postings, :status, :string  , default: "pending_review"
  end
end
