# frozen_string_literal: true

class JobSeekersController < ApplicationController
  before_action :set_job_seeker, only: %i[show edit update]
  authorize_resource

  def new
    @job_seeker = JobSeeker.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @job_seeker = current_user.build_job_seeker(job_seeker_params)

    if @job_seeker.save
      redirect_to @job_seeker
    else
      render partial: 'job_seekers/new', status: :unprocessable_entity
    end
  end

  def show
    return unless @job_seeker.nil?

    redirect_to new_job_seeker_path, notice: 'Please create your job seeker profile.'
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    if @job_seeker.update(job_seeker_params)
      redirect_to @job_seeker, notice: 'Profile updated successfully.'
    else
      render partial: 'job_seekers/edit', status: :unprocessable_entity
    end
  end

  private

  def set_job_seeker
    @job_seeker = current_user.job_seeker
  end

  def job_seeker_params
    params.require(:job_seeker).permit(:first_name, :last_name, :bio, :resume)
  end
end
