# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
    def after_sign_in_path_for(resource)
        user_management_admins_dashboard_index_path
    end
end
