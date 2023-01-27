class PostsController < ApplicationController
  def index
    @users = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    
    if @post.save
      flash[:notice] = 'Post saved successfully'
      redirect_to user_posts_path(current_user)
    else
      flash.now[:error] = 'Post could not be created!!'
      render :new
    end
  end

    private
# private method which will be used to filter the parameters that are passed to the create method.
    def post_params
      params.require(:post).permit(:title, :text)
    end
end
