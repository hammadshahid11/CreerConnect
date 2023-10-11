# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters
    before_action :check_blocked_status, only: [:create]

    private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name role])
    end

    def check_blocked_status
      return unless params[:user][:blocked] == '1'

      redirect_to root_path, alert: 'Registration is not allowed for blocked users.'
    end
  end
end
