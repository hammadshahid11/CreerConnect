# app/controllers/admins/registrations_controller.rb

class Admins::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  # Disable new admin registration
  def new
    redirect_to new_admin_session_path
  end

  # Disable admin registration
  def create
    redirect_to new_admin_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
