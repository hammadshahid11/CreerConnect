class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
  
  def after_signup
    if current_user.job_seeker?
      authorize! :create, JobSeekerProfile
      redirect_to new_job_seeker_profile_path
    elsif current_user.company?
      authorize! :create, CompanyProfile 
      redirect_to new_company_profile_path
    else
      # Handle other roles or scenarios
    end
  end

end
