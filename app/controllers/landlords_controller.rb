class LandlordsController < ApplicationController

  def index
    if params[:query].present?
      @landlords = Landlord.search_by_first_name_and_last_name_and_address(params[:query])
    else
      @landlords = Landlord.all
    end
  end
end
