class CommentsController < ApplicationController

  def create
    @review = Review.find params[:review_id]
    @comment = @review.comments.create comment_params
    @comment.user_id = current_user.user_id
    if @comment.save
      redirect_to @review
    else
      flash[:danger] = "Can not comment now"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :rating)
  end
end
