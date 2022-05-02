class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def five_most_recent_comments
    self.comments.order(created_at: :desc).limit(5)
  end

  def update_posts_counter
    user = User.find(user_id)
    user_posts = user.posts_counter
    user_posts = 0 unless user_posts
    user.update(posts_counter: user_posts + 1)
  end
end
