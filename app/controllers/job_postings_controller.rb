class JobPostingsController < ApplicationController
    before_action :set_company_profile, only: [:new, :create, :destroy]
    #  before_action :set_job_posting
    layout false, only: [:search]
    def index
        @job_postings =JobPosting.all
    end

    def display
      @job_postings=JobPosting.paginate(page: params[:page], per_page: 2)
      @current_job_seeker = current_user.job_seeker
    end
      
    def new
        @job_posting = @company_profile.job_postings.build
        respond_to do |format|
          format.html
          format.js
        end
    end
      
    def show
        @company_profile = CompanyProfile.find(params[:id])
        @job_postings = @company_profile.job_postings
    end

    def view_applicants
      @job_posting = JobPosting.find(params[:job_posting_id])
      @job_applicants = @job_posting.job_applications
    end
    
    def create
      if current_user.company_profile.present?
        @job_posting = current_user.company_profile.job_postings.build(job_posting_params)
    
        if @job_posting.save
          redirect_to company_profile_path(current_user.company_profile), notice: "Job posting was successfully created."
        else
          render 'new'
        end
      else
        redirect_to new_company_profile_path, alert: "Please create your company profile before posting a job."
      end
    end

      def search
        @query = params[:q]
        @location = params[:location]
        @salary_range = params[:salary_range]
      
        
        search = JobPosting.search(@query, fields: [:title, :company_name])
        # Apply filters based on the presence of values in instance variables
        # ...
        search = search.where(location: @location) if @location.present?

        if @salary_range.present?
          min_salary = BigDecimal(@salary_range)
          search = search.where(salary: min_salary.to_f) if @salary_range.present?
        end
        # Execute the search query
        @job_postings = search
      
        respond_to do |format|
          format.html # Render the HTML view (for initial page load)
          format.js   # Render the search results as a JavaScript response
        end
      end 
    
    def destroy
      @job_posting = @company_profile.job_postings.find(params[:id])

      if @job_posting.destroy
        respond_to do |format|
          format.html { redirect_to  company_profile_path(current_user.company_profile), notice: "Job posting was successfully deleted." }
        
        end
      end
    end

   private
    def set_company_profile
        @company_profile = CompanyProfile.find(params[:company_profile_id])
    end
    def set_job_posting
        @job_posting = @company_profile.job_postings.find(params[:id])
    end
    def job_posting_params
        # Define the permitted parameters for your JobPosting model here
        params.require(:job_posting).permit(:title, :company_name, :description, :location, :salary, :qualifications, :application_instructions)
    end
end
