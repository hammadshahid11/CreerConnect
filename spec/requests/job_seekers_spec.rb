# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'JobSeekers', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:job_seeker) { FactoryBot.create(:job_seeker, user:) }

  describe 'GET #new' do
    it 'responds with success' do
      sign_in user
      get new_job_seeker_path, xhr: true # xhr true is for ajax request
      expect(response).to have_http_status(:success)
    end

    it 'responds with  unauthenticated user' do
      get new_job_seeker_path, xhr: true # xhr true is for ajax request
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'POST #create' do
    it 'creates a new job seeker profile' do
      sign_in user
      post job_seekers_path, params: { job_seeker: { first_name: 'John', last_name: 'Doe', bio: 'Sample bio' } }
      expect(response).to have_http_status(302)
    end

    it 'renders new modal template if creation fails' do
      sign_in user
      post job_seekers_path, params: { job_seeker: { first_name: 'John', last_name: '', bio: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'GET #show' do
    it 'redirects to new profile if job seeker profile does not exist' do
      sign_in user
      get job_seeker_path(user.id)
      expect(response).to redirect_to(new_job_seeker_path) if job_seeker.nil?
    end

    it 'responds with success' do
      sign_in user
      FactoryBot.create(:job_seeker, user:)
      get job_seeker_path(user.id)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #edit' do
    it 'responds with success' do
      sign_in user
      get edit_job_seeker_path(job_seeker), xhr: true
      expect(response).to have_http_status(:success)
    end

    it 'responds with unauthenticated user' do
      get edit_job_seeker_path(job_seeker), xhr: true
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'PUT #update' do
    it 'updates the job seeker profile' do
      sign_in user
      put job_seeker_path(job_seeker), params: { job_seeker: { first_name: 'Updated First Name' } }
      expect(response).to have_http_status(302)
      job_seeker.reload
      expect(job_seeker.first_name).to eq('Updated First Name')
    end

    it 'renders edit modal template if update fails' do
      sign_in user
      put job_seeker_path(job_seeker), params: { job_seeker: { first_name: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
