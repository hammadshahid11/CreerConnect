# frozen_string_literal: true

class JobSeeker < ApplicationRecord
  belongs_to :user

  # has_many :saved_jobs, dependent: :destroy
  # has_many :job_postings, through: :saved_jobs
  has_and_belongs_to_many :job_postings, join_table: 'saved_jobs'

  has_many :job_applications, dependent: :destroy
  has_many :applied_job_postings, through: :job_applications, source: :job_posting
  has_many :messages, as: :messageable

  has_one_attached :resume

  validates :first_name, :last_name, presence: true
  validates :bio, length: { maximum: 500 }
end
