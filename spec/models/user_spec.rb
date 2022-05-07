require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = FactoryBot.create(:user)
    @posts_titles = ['Post 1', 'Post 2', 'Post 3', 'Post 4']
    @posts_titles.each do |title|
      FactoryBot.create(:post, title:, user_id: @user.id)
    end
  end
  describe 'Validations' do
    it 'is not valid without a name attribute' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid with post_counter less than 0' do
      @user.posts_counter = -1
      expect(@user).to_not be_valid
    end

    it 'is valid with integer posts_counter' do
      @user.posts_counter = 1
      expect(@user.posts_counter).to be_integer
    end
  end

  describe 'Methods' do
    it 'most recent posts must be three' do
      most_recent_posts = @user.three_most_recent_posts
      expect(most_recent_posts.size).to eq(3)
    end

    it 'first of most recent posts must be the last posts created' do
      first_most_recent_post = @user.three_most_recent_posts.first
      expect(first_most_recent_post.title).to eq('Post 4')
    end
  end
end
