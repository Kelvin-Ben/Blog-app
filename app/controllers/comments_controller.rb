class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comment.new(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      flash[:success] = 'Comment created'
      redirect_to user_post_path(current_user, @comment.post)
    else
      render :create
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
