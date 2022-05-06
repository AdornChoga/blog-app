class LikesController < ApplicationController
  def create
    new_like = Like.new
    new_like.post_id = params[:post_id]
    new_like.user_id = current_user.id
    new_like.save
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end
end
