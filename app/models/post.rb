class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def five_most_recent_comments
    self.comments.order(created_at: :desc).limit(5)
  end

  def update_posts_counter
    user = User.find(user_id)
    user.update(posts_counter: user.posts_counter + 1)
  end
end
