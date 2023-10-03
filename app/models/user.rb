class User < ApplicationRecord

  enum role: { job_seeker: 0, company: 1 }
 
  has_one :company_profile, dependent: :destroy
  has_one :job_seeker, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  
  attribute :blocked, :boolean, default: false
  
end
