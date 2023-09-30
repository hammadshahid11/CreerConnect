class CompanyProfilesController < ApplicationController
    # layout 'company' # Use the 'company' layout for CompanyProfile
    before_action :authenticate_user!
    authorize_resource # Use CanCanCan for authorization
  
      def new
        
          @company_profile = CompanyProfile.new
          respond_to do |format|
            format.html
            format.js 
          end
        
      end
  
    def create
      @company_profile = current_user.build_company_profile(company_profile_params)
  
      if @company_profile.save
        redirect_to @company_profile
      else
        render 'new'
      end
    end
  
    def show
      @company_profile = current_user.company_profile
      if @company_profile.nil?
        redirect_to new_company_profile_path, notice: "Please create your company profile."
      end
  
    end
  
    def edit
      @company_profile = current_user.company_profile
      respond_to do |format|
        format.html
        format.js 
      end
    end
  
    def update
      @company_profile = current_user.company_profile
  
      if @company_profile.update(company_profile_params)
        redirect_to @company_profile, notice: "Profile updated successfully."
      else
        render 'edit'
      end
    end
  
    private
  
    def company_profile_params
      # Define the permitted parameters for your CompanyProfile model here
      params.require(:company_profile).permit(:name, :bio)
    end
  end
  