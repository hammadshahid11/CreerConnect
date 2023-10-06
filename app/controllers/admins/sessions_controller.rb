# frozen_string_literal: true

module Admins
  class SessionsController < Devise::SessionsController
    def after_sign_in_path_for(_resource)
      user_management_admins_dashboard_index_path
    end
  end
end
