# frozen_string_literal: true

class JobApplication < ApplicationRecord
  belongs_to :job_seeker
  belongs_to :job_posting

  has_one_attached :resume

  has_many :messages, as: :messageable
end
