require 'rails_helper'

RSpec.describe Post, type: :request do
  describe 'GET #index' do
    before(:each) do
      user = FactoryBot.create(:user)
      get user_posts_url(user_id: user.id)
    end

    it 'should return a 302 response status code' do
      expect(response).to have_http_status 302
    end

    it 'include correct text in the body' do
      expect(response.body).to include 'You are being'
    end
  end

  describe 'GET #show' do
    before(:each) do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post, user_id: user.id)
      get user_post_path(user_id: user.id, id: post.id)
    end

    it 'should return a 302 response status code' do
      expect(response).to have_http_status 302
    end

    it 'include correct text in the body' do
      expect(response.body).to include 'You are being'
    end
  end
end
