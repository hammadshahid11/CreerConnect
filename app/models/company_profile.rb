class CompanyProfile < ApplicationRecord
  belongs_to :user
  has_many :job_postings , dependent: :destroy
  has_many :messages, as: :messageable
  validates :name, presence: true
  validates :bio, length: { maximum: 500 }
end
