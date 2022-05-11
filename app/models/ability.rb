class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Post
    can :read, Comment

    return unless user.present?

    can %i[create update destroy], Post, user: user
    can %i[create update destroy], Comment, user: user

    return unless user.role == 'admin'

    can :destroy, Post
    can :destroy, Comment
  end
end
