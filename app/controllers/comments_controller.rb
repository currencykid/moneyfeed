class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment , only: [:destroy] 
  def create 
    @comment = @commentable.comments.new comment_params
    @comment.user_id = current_user.id 

    if @comment.save
      redirect_to @commentable, notice: "Your comment was successfully posted." 
    else 
      redirect_to @commentable, notice: "Your comment was not created." 
    end 
  end 

  def destroy
    @comment.destroy
    redirect_to :back
  end 

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body) 
  end 
end 
