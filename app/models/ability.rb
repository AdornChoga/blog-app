class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Post
    return unless user.present?

    can %i[create update destroy], Post, user: user
    return unless user.role == 'admin'

    can :destroy, Post
  end
end
