require "test_helper"

class JobApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get job_applications_new_url
    assert_response :success
  end

  test "should get create" do
    get job_applications_create_url
    assert_response :success
  end

  test "should get show" do
    get job_applications_show_url
    assert_response :success
  end
end
