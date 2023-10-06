# frozen_string_literal: true

class SavedJob < ApplicationRecord
  belongs_to :job_seeker
  belongs_to :job_posting
end
