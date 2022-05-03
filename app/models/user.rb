class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments
  def self.three_most_recent_posts(user)
    user.posts.order(created_at: :desc).limit(3)
  end
end
