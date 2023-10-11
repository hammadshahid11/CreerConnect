# frozen_string_literal: true

class JobPosting < ApplicationRecord
  searchkick

  belongs_to :company_profile

  has_and_belongs_to_many :job_seekers, join_table: 'saved_jobs'
  has_many :job_applications, dependent: :destroy
  has_many :applying_job_seekers, through: :job_applications, source: :job_seeker

  scope :pending_review, -> { where(status: 'pending_review') }

  validates :title, presence: true, length: { maximum: 20 }
  validates :company_name, presence: true, length: { maximum: 20 }
  validates :description, presence: true
  validates :location, presence: true, length: { maximum: 20 }
  validates :salary, numericality: { greater_than_or_equal_to: 0 }
  validates :qualifications, presence: true
  validates :application_instructions, presence: true
end
