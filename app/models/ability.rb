# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.job_seeker?
      can :manage, JobSeeker, user_id: user.id
    elsif user.company?
      can :manage, CompanyProfile, user_id: user.id
    end
  end
end
