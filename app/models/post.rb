class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_posts_counter(user)
    user_posts = user.posts_counter
    user_posts ||= 0
    user.update(posts_counter: user_posts + 1)
  end
end
