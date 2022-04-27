require 'rails_helper'

describe 'Users index', type: :request do
  it 'should return a 200 response status code' do
    get '/users'
    expect(response).to have_http_status 200
  end

  it 'should render index template' do
    get '/users'
    expect(response).to render_template(:index)
  end
end

describe 'Users show', type: :request do
  it 'should return a 200 response status code' do
    get '/users/20'
    expect(response).to have_http_status 200
  end

  it 'should render show template' do
    get '/users/20'
    expect(response).to render_template(:show)
  end
end