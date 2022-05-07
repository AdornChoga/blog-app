require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user_id: @user.id)
    @comments_text = ['comment 1', 'comment 2', 'comment 3', 'comment 4', 'comment 5', 'comment 6']
    @comments_text.each do |comment_text|
      FactoryBot.create(:comment, text: comment_text, user_id: @user.id, post_id: @post.id)
    end
  end
  describe 'Validations' do
    it 'is not valid without a title' do
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it 'is valid without with title longer than 250 characters' do
      @post.title = 'a' * 256
      expect(@post).to_not be_valid
    end

    it 'is not valid with comments_counter less than 0' do
      @post.comments_counter = -1
      expect(@post).to_not be_valid
    end

    it 'is not valid with likes_counter less than 0' do
      @post.likes_counter = -1
      expect(@post).to_not be_valid
    end

    it 'is valid with integer comments_counter' do
      @post.comments_counter = 1
      expect(@post.comments_counter).to be_integer
    end

    it 'is valid with integer likes_counter' do
      @post.likes_counter = 1
      expect(@post.likes_counter).to be_integer
    end

    describe 'Methods' do
      it 'increments posts counter of user' do
        @post.update_posts_counter(@user)
        expect(@user.posts_counter).to eq(1)
      end

      it 'most recent comments must be 5' do
        most_recent_comments = @post.five_most_recent_comments
        expect(most_recent_comments.size).to eq(5)
      end

      it 'first of most recent comments must be the last comment made' do
        first_most_recent_comments = @post.five_most_recent_comments.first
        expect(first_most_recent_comments.text).to eq('comment 6')
      end
    end
  end
end
