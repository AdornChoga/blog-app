require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) {
    User.create(
    name: 'John',
    photo: 'https://randomuser.me/api/portraits/women/60.jpg',
    bio: "I'm a Footballer",
    posts_counter: 0
    )
  }
  let(:post) {
    Post.create(
    title: 'post1',
    text: 'lorem ipsum', user_id: user.id,
    comments_counter: 0, likes_counter: 0
    )
  }

  describe 'Validations' do
    it 'is not valid without a title' do
      post.title = nil
      expect(post).to_not be_valid
    end

    it 'is valid without with title longer than 250 characters' do
      post.title = 'a' * 256
      expect(post).to_not be_valid
    end

    it 'is not valid with comments_counter less than 0' do
      post.comments_counter = -1
      expect(post).to_not be_valid
    end

    it 'is not valid with likes_counter less than 0' do
      post.likes_counter = -1
      expect(post).to_not be_valid
    end

    it 'is valid with integer comments_counter' do
      post.comments_counter = 1
      expect(post.comments_counter).to be_integer
    end

    it 'is valid with integer likes_counter' do
      post.likes_counter = 1
      expect(post.likes_counter).to be_integer
    end
  end
end
