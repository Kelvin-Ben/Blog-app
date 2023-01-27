class CommentsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post

    if @comment.save
      redirect_to user_post_path(@user, @post)
    else
      render 'post/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
