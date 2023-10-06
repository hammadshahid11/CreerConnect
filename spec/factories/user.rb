# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { 'password123' }

    role { 'job_seeker' } # Randomly select a role from available roles
  end
end
