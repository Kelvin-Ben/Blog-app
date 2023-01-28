class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :asc)
  end

  def show
    @users = User.find(params[:id])
    @posts = Post.find(params[:id])
  end
end
