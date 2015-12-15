class ReviewsController < ApplicationController
  before_action :logged_in_user, except: [:index, :show]
  before_action :find_review, only: [:show, :edit, :update]
  before_action :regions

  def index
    @q = Review.ransack(params[:q])
    @reviews = @q.result(distinct: true)
  end

  def show
    @user = @review.user
    @address = @review.address
    @descriptions = @review.descriptions
    @images = @review.review_images
    @comment = @review.comments.build
    respond_to do |format|
      format.html
      format.json { render json: @review }
    end
  end

  def new
    @review = Review.new
    @regions = Region.all
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
      redirect_to @review
    else
      render "new"
    end
  end

  def edit
    @review.review_images.build
    # @user.avatar.build
  end

  def update
    if @review.update_attributes review_params
      flash[:success] = "Review updated"
      redirect_to @review
    else
      render "edit"
    end
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(:user_id, :name, :content, :phone_number, :portable, :rating,
      address_attributes: [:id, :region_id, :name, :lat, :lng],
      descriptions_attributes: [:id, :name, :price],
      review_images_attributes: [:id, :image]
    )
  end

  def find_review
    @review = Review.find params[:id]
  end

  def regions
    @regions = Region.all
  end
end
