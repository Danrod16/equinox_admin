class LandlordsController < ApplicationController

  def index
    if params[:query].present?
      @landlords = Landlord.search_by_first_name_and_last_name_and_address(params[:query])
    else
      @landlords = Landlord.all
    end
  end

  def show
    @landlord = Landlord.find(params[:id])
    @bookings = @landlord.flats.extract_associated(:bookings).first
  end
end
