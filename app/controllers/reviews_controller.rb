class ReviewsController < ApplicationController
  before_action :logged_in_user, except: [:index, :show]

  def index
    @reviews = Review.all
  end

  def show

  end

  def new
    @review = Review.new
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
    params.require(:micropost).permit(:name, :content, :phone_number, :portable,
      addresses_attributes: [:id, :province, :town, :lat, :lng],
      descriptions_attributes: [:id, :name, :price]
    )
  end
end
