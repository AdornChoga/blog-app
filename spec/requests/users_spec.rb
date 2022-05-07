require 'rails_helper'

describe User, type: :request do
  describe 'GET #index' do
    before(:example) { get('/users') }
    it 'should return a 200 response status code' do
      expect(response).to have_http_status 200
    end

    it 'should render index template' do
      expect(response).to render_template(:index)
    end

    it 'include correct text in the body' do
      expect(response.body).to include 'Bloggers'
    end
  end

  describe 'GET #show' do
    before(:example) { get('/users/1') }

    it 'should return a 200 response status code' do
      expect(response).to have_http_status 200
    end

    it 'should render show template' do
      expect(response).to render_template(:show)
    end

    it 'include correct text in the body' do
      expect(response.body).to include 'Bio'
    end
  end
end
