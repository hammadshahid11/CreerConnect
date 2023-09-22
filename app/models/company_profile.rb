class CompanyProfile < ApplicationRecord
  belongs_to :user
  has_many :job_postings , dependent: :destroy
  validates :name, presence: true
  validates :bio, length: { maximum: 500 }
end
