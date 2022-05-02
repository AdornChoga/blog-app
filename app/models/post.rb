class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def update_posts_counter
    user = User.find(self.user_id)
    user.increment(:posts_counter)
  end
end
