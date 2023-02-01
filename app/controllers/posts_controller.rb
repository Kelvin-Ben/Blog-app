class PostsController < ApplicationController
  def index
    @users = User.includes(:posts).find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @author = User.find(params[:user_id])
    @comments = Comment.where(post_id: params[:id])
    @comments = @post.comments.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      flash[:notice] = 'Post saved successfully'
      redirect_to user_posts_path(@post.author, @post)
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
