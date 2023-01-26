class PostsController < ApplicationController
  def index
    # @posts = Post.all
    @users = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end
end
