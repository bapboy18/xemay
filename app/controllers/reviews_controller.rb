class ReviewsController < ApplicationController
  before_action :logged_in_user

  def index

  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      flash[:success] = "Review created!"
      redirect_to root_url
    else
      render "static_pages/home"
    end
  end

  def destroy

  end

  private
  def reviews_params
    params.require(:micropost).permit(:content)
  end
end
