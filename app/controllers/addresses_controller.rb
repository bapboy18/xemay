class AddressesController < ApplicationController

  def index
    @addresses = Address.all
  end

  private
  def address_params
    params.require(:address).permit :region_id, :review_id, :name, :lat, :lng
  end
end
