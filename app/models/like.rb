class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :user_id, :post_id, presence: true

  def update_likes_counter(post)
    post_likes = post.likes_counter
    post_likes ||= 0
    post.update(likes_counter: post_likes + 1)
  end
end
