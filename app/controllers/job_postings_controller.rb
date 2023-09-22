class JobPostingsController < ApplicationController
    before_action :set_company_profile, only: [:new, :create, :destroy]
    #  before_action :set_job_posting
    def index
        
        # Display a list of all job postings (you may want to paginate here)
        # @job_postings =JobPosting.all
        # @job_postings = JobPosting.all.paginate(page: params[:page], per_page: 5)
      end

      def display
        @job_postings=JobPosting.paginate(page: params[:page], per_page: 2)
        @current_job_seeker = current_user.job_seeker
      end
      
      def new
        # @company_profile = CompanyProfile.find(params[:company_profile_id])
        @job_posting = @company_profile.job_postings.build
      end
      
   
    def show
        # Find the job posting using the company profile and job posting ID
        # @job_posting = @company_profile.job_postings.find(params[:id])
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
        @job_type = params[:job_type]
        @salary_range = params[:salary_range]
    
        @job_postings = JobPosting.search(@query, fields: [:title, :company_name], where: { location: @location, job_type: @job_type, salary_range: @salary_range })
    
        # Additional filtering logic based on other criteria (industry, experience level, etc.)
    
        # Render the search results view
        render 'search_results'
      
      end
      
    def destroy
        @job_posting.destroy

        respond_to do |format|
          format.html { redirect_to  company_profile_path(current_user.company_profile), notice: "Job posting was successfully deleted." }
        #   format.turbo_stream { render turbo_stream: turbo_stream.remove(@job_posting) }

        # redirect_to company_profile_path(current_user.company_profile), notice: "Job posting was successfully deleted."
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
