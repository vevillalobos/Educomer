class Ability
  include CanCan::Ability
  #registered = regular user
  #banned = banned user
  #score = can modify scores of food
  #information = can modify nutrition and ingredient of food + score
  #allinfo = can modify all fields of food
  #admin = administrator
  def initialize(user)
    user ||= User.new
    if user.has_role? :admin
        can :manage, :all
    elsif user.has_role? :score
        can :update, Food
    elsif user.has_role? :information
        can :update, Food
    elsif user.has_role? :allinfo
        can :update, Food
    else
        can :read, :all
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
