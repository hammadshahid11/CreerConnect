# frozen_string_literal: true

class SavedJobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @job_seeker = JobSeeker.find(params[:job_seeker_id])
    @saved_jobs = @job_seeker.saved_jobs
  end

  def save
    @job_seeker = JobSeeker.find(params[:job_seeker_id])
    @job_posting = JobPosting.find(params[:id])

    existing_saved_job = SavedJob.find_by(job_seeker: @job_seeker, job_posting: @job_posting)

    if existing_saved_job
      redirect_to job_seeker_saved_jobs_path(@job_seeker), alert: 'Job has already been saved.'
    else
      @saved_job = SavedJob.new(job_seeker: @job_seeker, job_posting: @job_posting, date_saved: Time.now)
      if @saved_job.save
        redirect_to job_seeker_saved_jobs_path(@job_seeker), notice: 'Job saved successfully.'
      else
        redirect_to job_listing_path(@job_posting), alert: 'Job could not be saved.'
      end
    end
  end

  def create
    @job_seeker = JobSeeker.find(params[:job_seeker_id])
    @job_posting = JobPosting.find(params[:job_posting_id])

    @saved_job = SavedJob.new(job_seeker: @job_seeker, job_posting: @job_posting, date_saved: Time.now)
    if @saved_job.save!

      redirect_to job_seeker_saved_jobs_path(@job_seeker), notice: 'Job saved successfully.'
    else
      redirect_to job_listing_path(@job_posting), alert: 'Job could not be saved.'
    end
  end

  def destroy
    @job_seeker = JobSeeker.find(params[:job_seeker_id])
    @job_posting = JobPosting.find(params[:id])

    @saved_job = SavedJob.find_by(job_seeker: @job_seeker, job_posting: @job_posting)

    if @saved_job&.destroy
      redirect_to job_seeker_saved_jobs_path(@job_seeker), notice: 'Job removed from saved list.'
    else
      redirect_to job_seeker_saved_jobs_path(@job_seeker), alert: 'Unable to remove the job.'
    end
  end
end
