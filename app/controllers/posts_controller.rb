class PostsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :post_params

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def new
    @post = Post.new
  end

  def create
    if @post.save
      @post.update_posts_counter(current_user)
      redirect_to user_posts_path(current_user), notice: 'Post was successfully created'
    else
      redirect_to new_user_post_path(current_user.id), notice: @post.errors.first.full_message.to_s
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def destroy
    if @post.destroy
      @post.update_posts_counter(current_user)
      flash[:notice] = 'Post deleted successfully'
      redirect_to user_posts_path(params[:user_id])
    else
      flash[:notice] = 'Post was not deleted'
      redirect_to user_post_path(params[:user_id], @post)
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
