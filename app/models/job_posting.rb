class JobPosting < ApplicationRecord
  belongs_to :company_profile
  searchkick 
  has_many :saved_jobs, dependent: :destroy
  has_many :job_seekers, through: :saved_jobs


  has_many :job_applications, dependent: :destroy
  has_many :applying_job_seekers, through: :job_applications, source: :job_seeker
  # self.per_page = 5
  scope :pending_review, -> { where(status: 'pending_review') }
end
