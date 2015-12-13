class CommentsController < ApplicationController

  def create
    @comment = Comment.create! comment_params
    respond_to do |format|
      format.html { }
      format.js
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :review_id, :content)
  end
end
