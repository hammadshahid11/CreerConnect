# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |_exception|
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end

  def after_signup
    if current_user.job_seeker?
      authorize! :create, JobSeekerProfile
      redirect_to new_job_seeker_profile_path
    elsif current_user.company?
      authorize! :create, CompanyProfile
      redirect_to new_company_profile_path
    end
  end
end
