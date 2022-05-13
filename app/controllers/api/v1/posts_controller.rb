class Api::V1::PostsController < Api::V1::ApiController
  before_action :authorize_user
  def index
    user_id = params[:user_id]
    @posts = User.find(user_id).posts
    render json: @posts, status: :ok
  end
end
