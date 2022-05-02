class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def update_likes_counter
    post = Post.find(post_id)
    post_likes = post.likes_counter
    post_likes = 0 unless post_likes
    post.update(likes_counter: post_likes + 1)
  end
end
