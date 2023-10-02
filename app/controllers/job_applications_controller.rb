class JobApplicationsController < ApplicationController
  before_action :authenticate_user! # Add authentication as needed

  
    def new
      @job_posting = JobPosting.find(params[:job_posting_id]) # Retrieve the job posting
      @job_application = JobApplication.new
      respond_to do |format|
        format.html
        format.js 
      end
    end


  def create
    @job_application = JobApplication.new(job_application_params)
    @job_application.job_seeker = current_user.job_seeker
    if @job_application.save
      # Handle successful submission (e.g., send confirmation email)
      redirect_to @job_application, notice: 'Job application submitted successfully.'
    else
      render :new
    end
  end

  def show
    @job_application = JobApplication.find(params[:id])
  end

  private

  def job_application_params
    params.require(:job_application).permit(:resume, :cover_letter, :job_posting_id)
  end
end

