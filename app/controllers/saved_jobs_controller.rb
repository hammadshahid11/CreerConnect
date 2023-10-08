# frozen_string_literal: true

class SavedJobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @job_seeker = current_user.job_seeker
    @saved_jobs = @saved_jobs = @job_seeker.job_postings
  end

  def save
    @job_seeker = current_user.job_seeker
    @job_posting = JobPosting.find(params[:id])
    @job_seeker.job_postings << @job_posting

    redirect_to saved_jobs_path(job_seeker_id: @job_seeker.id), notice: 'Job saved successfully.'
  end

  def destroy
    @job_seeker = current_user.job_seeker
    job_posting_id = params[:id]
    @job_posting = JobPosting.find(job_posting_id)

    return unless @job_seeker.job_postings.exists?(job_posting_id)

    @job_seeker.job_postings.delete(job_posting_id)
    redirect_to saved_jobs_path(job_seeker_id: @job_seeker.id), notice: 'Job removed from saved list.'
  end

  def saved_job_params
    params.require(:saved_job).permit!
  end
end
