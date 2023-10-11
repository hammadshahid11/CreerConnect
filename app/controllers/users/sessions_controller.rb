# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    before_action :check_blocked_status, only: [:create]

    private

    def check_blocked_status
      user = User.find_by(email: params[:user][:email])
      return unless user&.blocked?

      sign_out user
      redirect_to new_user_session_path, alert: 'Your account is blocked. Please contact support for assistance.'
    end
  end
end
