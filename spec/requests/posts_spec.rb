require 'rails_helper'

RSpec.describe Post, type: :request do
  describe 'GET #index' do
    before(:each) do
      get '/users/1/posts'
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
      get '/users/1/posts/1'
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
