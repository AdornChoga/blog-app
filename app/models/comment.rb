class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :text, presence: true, length: { maximum: 250 }

  def update_comments_counter(post)
    post_comments = post.comments.count
    post.update(comments_counter: post_comments)
  end
end
