# frozen_string_literal: true

FactoryBot.define do
  factory :job_seeker do
    user

    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    bio { Faker::Lorem.paragraph(sentence_count: 2) }

    trait :with_resume do
      resume { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'sample_resume.pdf')) }
    end
  end
end
