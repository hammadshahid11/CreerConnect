class SavedJobsController < ApplicationController
    before_action :authenticate_user! # Add authentication as needed
  
    # Display a list of saved jobs for a job seeker
    def index
      @job_seeker = JobSeeker.find(params[:job_seeker_id])
      @saved_jobs = @job_seeker.saved_jobs
      
      

    end
    def new
      @job_seeker = JobSeeker.find(params[:job_seeker_id])
      @job_posting = JobPosting.find(params[:job_posting_id])
    
      # Check if the job has already been saved by the job seeker
      existing_saved_job = SavedJob.find_by(job_seeker: @job_seeker, job_posting: @job_posting)
    
      if existing_saved_job
        redirect_to job_seeker_saved_jobs_path(@job_seeker), alert: 'Job has already been saved.'
      else
        # Create a new saved job record
        @saved_job = SavedJob.new(job_seeker: @job_seeker, job_posting: @job_posting, date_saved: Time.now)
    
        if @saved_job.save
          redirect_to job_seeker_saved_jobs_path(@job_seeker), notice: 'Job saved successfully.'
        else
          redirect_to job_listing_path(@job_posting), alert: 'Job could not be saved.'
        end
      end
    end
    

    # Create a new saved job for a job seeker
    def create
      debugger
      @job_seeker = JobSeeker.find(params[:job_seeker_id])
      @job_posting = JobPosting.find(params[:job_posting_id])
  
      # Create a new saved job record
      @saved_job = SavedJob.new(job_seeker: @job_seeker, job_posting: @job_posting, date_saved: Time.now)
  
      if @saved_job.save!
        
        redirect_to job_seeker_saved_jobs_path(@job_seeker), notice: 'Job saved successfully.'
      else
        redirect_to job_listing_path(@job_posting), alert: 'Job could not be saved.'
      end
    end
  
   

    # Remove a saved job for a job seeker
    def destroy
      @job_seeker = JobSeeker.find(params[:job_seeker_id])
      @job_posting = JobPosting.find(params[:id]) # Use params[:id] to find the job posting

      # Find the saved job based on both job seeker and job posting
      @saved_job = SavedJob.find_by(job_seeker: @job_seeker, job_posting: @job_posting)

      if @saved_job && @saved_job.destroy
        redirect_to job_seeker_saved_jobs_path(@job_seeker), notice: 'Job removed from saved list.'
      else
        redirect_to job_seeker_saved_jobs_path(@job_seeker), alert: 'Unable to remove the job.'
      end
    end

  end
  