require 'rails_helper'

RSpec.describe Post, type: :request do
  describe 'GET #index' do
    before(:each) do
      user = User.create(name: 'Nuri', bio: 'biography for testing', photo: 'photo link', posts_counter: 0)
      get user_posts_path(user_id: user.id)
    end

    it 'should return a 200 response status code' do
      expect(response).to have_http_status 200
    end

    it 'should render index template' do
      expect(response).to render_template(:index)
    end

    it 'include correct text in the body' do
      expect(response.body).to include 'Number of posts'
    end
  end

  describe 'GET #show' do
    before(:each) do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post, user_id: user.id)
      get user_post_path(user_id: user.id, id: post.id)
    end

    it 'should return a 200 response status code' do
      expect(response).to have_http_status 200
    end

    it 'should render show template' do
      expect(response).to render_template(:show)
    end

    it 'include correct text in the body' do
      expect(response.body).to include 'Comments'
    end
  end
end
