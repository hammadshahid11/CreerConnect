class JobPosting < ApplicationRecord
  belongs_to :company_profile
  searchkick word_start: [:title, :company_name]
  has_many :saved_jobs, dependent: :destroy
  has_many :job_seekers, through: :saved_jobs
  # self.per_page = 5
end
