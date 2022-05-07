class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      @comment.update_comments_counter
      redirect_to user_post_path(params[:user_id], @post.id), notice: 'You commented on this post!'
    else
      redirect_to new_user_post_comment_path(params[:user_id], params[:post_id]),
                  notice: @comment.errors.first.full_message.to_s
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
