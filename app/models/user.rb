class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  enum role: { job_seeker: 0, company: 1 }
  has_one :company_profile, dependent: :destroy
  has_one :job_seeker, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  attribute :blocked, :boolean, default: false
  # Create a company profile for a company user after user creation
  # after_create :create_company_profile_if_company
  
  # private

  # def create_company_profile_if_company
  #   CompanyProfile.create(user: self) if company?
  # end
end
