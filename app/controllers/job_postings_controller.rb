# frozen_string_literal: true

class JobPostingsController < ApplicationController
  before_action :set_company_profile, only: %i[new create destroy]
  before_action :authenticate_user!
  layout false, only: [:search]

  def index
    @company_profile = CompanyProfile.find(params[:company_profile_id])
    @job_postings = @company_profile.job_postings
  end

  def display
    @job_postings = JobPosting.paginate(page: params[:page], per_page: 3)
    @current_job_seeker = current_user.job_seeker
  end

  def new
    @job_posting = @company_profile.job_postings.build
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @company_profile = CompanyProfile.find(params[:id])
    @job_postings = @company_profile.job_postings
  end

  def view_applicants
    @job_posting = JobPosting.find(params[:job_posting_id])
    @job_applicants = @job_posting.job_applications
  end

  def create
    if current_user.company_profile.present?
      @job_posting = current_user.company_profile.job_postings.build(job_posting_params)

      if @job_posting.save
        redirect_to company_profile_path(current_user.company_profile),
                    notice: 'Job posting was successfully created.'
      else
        render 'new'
      end
    else
      redirect_to new_company_profile_path, alert: 'Please create your company profile before posting a job.'
    end
  end

  def search
    @query = params[:q]
    @location = params[:location]
    @salary_range = params[:salary_range]

    search = JobPosting.search(@query, fields: %i[title company_name])
    search = search.where(location: @location) if @location.present?

    if @salary_range.present?
      min_salary = BigDecimal(@salary_range)
      search = search.where(salary: min_salary.to_f) if @salary_range.present?
    end

    @job_postings = search

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @job_posting = @company_profile.job_postings.find(params[:id])

    return unless @job_posting.destroy

    respond_to do |format|
      format.html do
        redirect_to company_profile_path(current_user.company_profile), notice: 'Job posting was successfully deleted.'
      end
    end
  end

  private

  def set_company_profile
    @company_profile = CompanyProfile.find(params[:company_profile_id])
  end

  def set_job_posting
    @job_posting = @company_profile.job_postings.find(params[:id])
  end

  def job_posting_params
    params.require(:job_posting).permit(:title, :company_name, :description, :location, :salary, :qualifications,
                                        :application_instructions)
  end
end
