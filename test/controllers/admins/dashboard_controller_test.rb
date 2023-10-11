# frozen_string_literal: true

require 'test_helper'

module Admins
  class DashboardControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get admins_dashboard_index_url
      assert_response :success
    end
  end
end
