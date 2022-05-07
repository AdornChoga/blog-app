class LikesController < ApplicationController
  def create
    @new_like = Like.new
    @new_like.post_id = params[:post_id]
    @new_like.user_id = current_user.id
    @new_like.save
    if @new_like.save
      @new_like.update_likes_counter(Post.find(params[:post_id]))
      redirect_to user_post_path(params[:user_id], params[:post_id]), notice: 'You liked this post!'
    else
      redirect_to user_post_path(params[:user_id], params[:post_id]), notice: @new_like.errors.first.full_message.to_s
    end
  end
end
