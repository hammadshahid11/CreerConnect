# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :messageable, polymorphic: true
  belongs_to :job_application
end
