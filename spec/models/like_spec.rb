require 'rails_helper'

RSpec.describe Like, type: :model do
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
  let(:like) do
    Like.create(
      user_id: user.id,
      post_id: post.id
    )
  end

  describe 'Validations' do
    it 'is not valid without text attribute' do
      like.user_id = nil
      expect(like).to_not be_valid
    end

    it 'is not valid when text is greater than 250 characters' do
      like.post_id = nil
      expect(like).to_not be_valid
    end
  end
end
