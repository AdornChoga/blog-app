require 'rails_helper'

describe 'Users index', type: :request do
  before(:each) do
    get '/users'
  end

  it 'should return a 200 response status code' do
    expect(response).to have_http_status 200
  end

  it 'should render index template' do
    expect(response).to render_template(:index)
  end

  it 'include correct text in the body' do
    expect(response.body).to include 'Here is a list of all users...'
  end
end

describe 'Users show', type: :request do
  before(:each) do
    get '/users/20'
  end

  it 'should return a 200 response status code' do
    expect(response).to have_http_status 200
  end

  it 'should render show template' do
    expect(response).to render_template(:show)
  end

  it 'include correct text in the body' do
    expect(response.body).to include 'Here is a user with id: 20'
  end
end