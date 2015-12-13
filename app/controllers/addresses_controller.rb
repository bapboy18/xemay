class AddressesController.rb < ApplicationController

  def create
    @review = Review.find params[:review_id]
    @address = @review.addresses.new address_params
    # @address.region_id = @review.region_id
    @address.save
  end

  private
  def address_params
    params.require(:address).permit :review_id, :name, :lat, :lng
  end
end
