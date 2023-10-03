class Admins::DashboardController < ApplicationController
  before_action :authenticate_admin!

  def index
  end

  def user_management
    @users = User.all # Adjust the query as needed, e.g., filtering by role.
    @job_postings = JobPosting.where(status: 'pending_review')
  end

  def block_user
    user = User.find(params[:format])
    user.update(blocked: true)
    redirect_to user_management_admins_dashboard_index_path, notice: 'User blocked successfully.'
  end

  def unblock_user
    user = User.find(params[:format])
    user.update(blocked: false) # Set blocked to false to unblock the user
    redirect_to user_management_admins_dashboard_index_path, notice: 'User unblocked successfully.'
  end

  def delete_user
    user = User.find(params[:format])
    user.destroy
    redirect_to user_management_admins_dashboard_index_path, notice: 'User deleted successfully.'
  end

  
  def approve_job_listing
    job_posting = JobPosting.find(params[:id])
    job_posting.update(status: 'approved') # For example, mark it as approved.
    redirect_to user_management_admins_dashboard_index_path, notice: 'Job listing approved successfully.'
  end
  
  def disapprove_job_listing
    job_posting = JobPosting.find(params[:id])
    job_posting.update(status: 'disapproved') # For example, mark it as disapproved.
    redirect_to user_management_admins_dashboard_index_path, notice: 'Job listing disapproved successfully.'
  end
  
end
