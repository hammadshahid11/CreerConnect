class JobSeeker < ApplicationRecord
  belongs_to :user  
  has_many :saved_jobs, dependent: :destroy
  has_many :job_postings, through: :saved_jobs
  has_many :job_applications, dependent: :destroy
  has_many :applied_job_postings, through: :job_applications, source: :job_posting

  has_many :messages, as: :messageable 

  # validate :user_can_have_only_one_job_seeker_profile 
  validates :first_name, :last_name, presence: true
  validates :bio, length: { maximum: 500 }
  has_one_attached :resume
  

 
  private

  # def user_can_have_only_one_job_seeker_profile
  #   if user.job_seeker.present? && !user.job_seeker.new_record?
  #     errors.add(:user, "already has a job seeker profile")
  #   end
  # end
end
