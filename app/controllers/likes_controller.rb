class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = Like.new
    @like.author = current_user
    @like.post = @post

    if @like.save
      redirect_to user_post_path(@user, @post)
    else
      render 'posts/show'
    end
  end
end
