class FlatsController < ApplicationController
  def index
    if params[:query].present?
      @flats = Flat.search_by_name_or_street(params[:query])
    else
      @flats = Flat.all
    end
  end

  def new
    @flat = Flat.new
    @landlord = Landlord.new
  end

  def create
    @flat = Flat.new(flat_params)
  end

  private

  def flat_params
    params.require(:flat).permit(:celula, :catastral, :index, :cee, :expenses, :insurance, :insurance_phone, :keys, :equinox_costs, :photos, :video, :furnished, :landlord_id, :available, :name, :reference, :street, :number, :postal_code, :city, :country, :letter_box, :reference_rent, :habitability_number, :catastral_number)
  end
end
