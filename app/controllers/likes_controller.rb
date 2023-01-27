class LikesController < ApplicationController
  def create
    @like = current_user.likes.new
    @like.post_id = params[:post_id]

    if @like.save
      flash[:success] = "Liked"
      redirect_to user_post_path(current_user, @like.post)
    else
      render create
    end
  end
end
