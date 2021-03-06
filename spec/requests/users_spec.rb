require 'rails_helper'

RSpec.describe User, type: :request do
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
    before(:each) do
      @user = FactoryBot.create(:user)
      get user_path(id: @user.id)
    end

    it 'should return a 200 response status code' do
      expect(response).to have_http_status 302
    end

    it 'include correct text in the body' do
      expect(response.body).to include 'You are being'
    end
  end
end
