class JobSeekersController < ApplicationController
    layout 'jobseeker'
    before_action :authenticate_user!
    authorize_resource
    
    def new
    
            if current_user.job_seeker.present?
              redirect_to job_seeker_path(current_user.job_seeker)
            else
              @job_seeker = JobSeeker.new
            end
          
    end
  
    def create
        debugger
        @job_seeker = current_user.build_job_seeker(job_seeker_params)
      
        if @job_seeker.save
          redirect_to @job_seeker
        else
          render 'new'
        end
      end
      
    
      def show
        @job_seeker = current_user.job_seeker
        if @job_seeker.nil?
          redirect_to new_job_seeker_path, notice: "Please create your job seeker profile."
        end
      end
       # Other actions (e.g., show, edit, update, destroy) can be defined here
    # ...
    
    def edit
        @job_seeker = current_user.job_seeker
        if @job_seeker.nil?
          redirect_to new_job_seeker_path, notice: "Please create your job seeker profile."
        else
          render 'edit'
        end
      end
      

        
    def update
      # debugger
      @job_seeker = current_user.job_seeker

    
      if @job_seeker.update(job_seeker_params)
        redirect_to @job_seeker, notice: "Profile updated successfully."
      else
        render 'edit'
      end
    end
    
    private
  
    def job_seeker_params
      # Define the permitted parameters for your Job Seeker model here
      params.require(:job_seeker).permit(:first_name, :last_name, :bio, :resume)
    end
  end
  