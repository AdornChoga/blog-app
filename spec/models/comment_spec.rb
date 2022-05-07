require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) do
    User.create(
      name: 'John',
      photo: 'https://randomuser.me/api/portraits/women/60.jpg',
      bio: "I'm a Footballer",
      posts_counter: 0
    )
  end
  let(:post) do
    Post.create(
      title: 'post1',
      text: 'lorem ipsum', user_id: user.id,
      comments_counter: 0, likes_counter: 0
    )
  end
  let(:comment) do
    Comment.create(
      text: 'Nice',
      user_id: user.id,
      post_id: post.id,
    )
  end

  describe 'Validations' do
   it 'is not valid without text attribute' do
    comment.text = nil
    expect(comment).to_not be_valid
   end

   it 'is not valid when text is greater than 250 characters' do
    comment.text = 'a' * 256
    expect(comment).to_not be_valid
   end
  end
end
