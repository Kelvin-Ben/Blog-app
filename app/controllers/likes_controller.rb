class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = current_user.likes.build(like_params)
    @like.post_id = params[:post_id]

    if @like.save
      redirect_to user_post_path(@like.post), notice: 'Like created'
    else
      render :create
    end
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
