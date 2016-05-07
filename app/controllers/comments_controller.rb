class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post
  before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
  before_action :comment_owner, only: [:destroy, :edit, :update] 

  def create
    @comment = @post.comments.create(params[:comment].permit(:content)) 
    @comment.user_id = current_user.id
    @comment.save 

    if @comment.save
      redirect_to :back, notice: "Your comment was successfully posted." 
    else
      redirect_to :back, notice: "Your comment was not created." 
    end 
  end 

  def destroy
    @comment.destroy
    redirect_to :back, notice: "Your comment was deleted." 
  end

  def edit

  end

  def update
    if @comment.update(params[:comment].permit(:content)) 
    redirect_to post_path(@post), notice: "Your comment was successfully updated."
    else
      flash[:notice] = "Comment wasn't posted. Maybe it's too long."  
      render 'edit' 
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id]) 
  end 

  def find_comment
    @comment = @post.comments.find(params[:id])
  end 

  def comment_owner 
    unless current_user.id == @comment.user_id
      flash[:notice] = "You sneaky bastard, you. Nice try." 
      redirect_to @post
    end 
  end 
end
