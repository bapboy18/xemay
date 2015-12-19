class AddressesController < ApplicationController

  def index
    @addresses = Address.all
    @reviews = @addresses.inject([]) do |array, add|
    	array << add.review
    	array
    end
  end

  private
  def address_params
    params.require(:address).permit :region_id, :review_id, :name, :lat, :lng
  end
end
