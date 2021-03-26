# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin_role?
      can :manage, :all
      can :access, :admin_portal
    end
    if user.user_role?
      can :access, :user_dashboard
    end
  end
end
