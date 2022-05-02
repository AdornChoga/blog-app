class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def update_posts_counter
    user = User.find(user_id)
    user.update(posts_counter: user.posts_counter + 1)
  end
end
