class Api::V1::CommentsController < Api::V1::ApiController
  before_action :authorize_user

  def index
    post_id = params[:post_id]
    @comments = Post.find(post_id).comments
    render json: @comments, status: :ok
  end
end