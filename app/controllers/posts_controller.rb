class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      @post.update_posts_counter
      redirect_to user_posts_path(current_user), notice: 'Post was successfully created'
    else
      redirect_to new_user_post_path(current_user.id), notice: "#{@post.errors.first.full_message}"
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
