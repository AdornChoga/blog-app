class PostsController < ApplicationController
  def index; end

  def show
    @post_id = params[:id]
  end
end

Comment.create(text: 'Hi Tom!', user_id: second_user.id, post_id: first_post.id)
