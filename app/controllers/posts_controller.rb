class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.includes(:comments, :likes).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      flash[:notice] = 'Post saved successfully'
      redirect_to user_post_path(current_user, @post)
    else
      flash.now[:error] = 'Post could not be created!!'
      render :new
    end
  end

  private

  # # private method which will be used to filter the parameters that are passed to the create method.
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
