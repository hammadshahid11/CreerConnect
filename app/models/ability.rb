class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)
    if user.job_seeker?
      can :manage, JobSeeker, user_id: user.id
      # Define other abilities for job seekers here
    elsif user.company?
      can :manage, CompanyProfile, user_id: user.id
      # Define other abilities for companies here
    end
  end
end
