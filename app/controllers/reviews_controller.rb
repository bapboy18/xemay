class ReviewsController < ApplicationController
  before_action :logged_in_user, except: [:index, :show]
  before_action :find_review, only: [:show, :edit]

  def index
    @reviews = Review.all
  end

  def show
    @user = @review.user
    @address = @review.address
    @descriptions = @review.descriptions
    @images = @review.review_images
    respond_to do |format|
      format.html
      format.json { render json: @review }
    end
  end

  def new
    @review = Review.new
    @review.review_images.build
    @review.build_address
    @review.descriptions.build
    respond_to do |format|
      format.html
      format.json { render json: @review }
    end
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      flash[:success] = "Review created!"
      redirect_to root_url
    else
      render "new"
    end
  end

  def edit
    @review.review_images.build
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(:name, :content, :phone_number, :portable, :rating,
      addresses_attributes: [:id, :province, :town, :lat, :lng],
      descriptions_attributes: [:id, :name, :price],
      review_images_attributes: [:id, :image]
    )
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
