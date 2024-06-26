# frozen_string_literal: true

class AddUserReferenceToJobSeekers < ActiveRecord::Migration[7.0]
  def change
    add_reference :job_seekers, :user, null: false, foreign_key: true
  end
end
