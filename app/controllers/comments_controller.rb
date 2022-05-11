class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :comment_params

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      @comment.update_comments_counter(@post)
      redirect_to user_post_path(params[:user_id], @post.id), notice: 'You commented on this post!'
    else
      redirect_to new_user_post_comment_path(params[:user_id], params[:post_id]),
                  notice: @comment.errors.first.full_message.to_s
    end
  end

  def destroy
    flash[:notice] = if @comment.destroy
                       'Comment deleted successfully'
                     else
                       'Comment was not deleted successfully'
                     end
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
