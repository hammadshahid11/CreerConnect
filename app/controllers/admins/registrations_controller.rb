# frozen_string_literal: true

# app/controllers/admins/registrations_controller.rb

module Admins
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters

    def new
      redirect_to new_admin_session_path
    end

    def create
      redirect_to new_admin_session_path
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    end
  end
end
