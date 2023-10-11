# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JobSeeker, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it 'has a valid factory' do
    job_seeker = FactoryBot.build(:job_seeker)
    expect(job_seeker).to be_valid
  end

  context 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:bio).is_at_most(500) }
  end

  context 'resume attachment' do
    it 'is valid when attached' do
      job_seeker = FactoryBot.create(:job_seeker)
      job_seeker.resume.attach(io: File.open(Rails.root.join('spec', 'support', 'sample_resume.pdf')),
                               filename: 'sample_resume.pdf', content_type: 'application/pdf')
      expect(job_seeker.resume).to be_attached
    end
    it 'is invalid when not attached' do
      job_seeker = FactoryBot.create(:job_seeker)
      expect(job_seeker.resume).not_to be_attached
    end
  end
end
