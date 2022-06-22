class LandlordsController < ApplicationController

  def index
    if params[:query].present?
      @landlords = Landlord.search_by_first_name_and_last_name_and_address(params[:query])
    else
      @landlords = Landlord.all
    end

    respond_to do |format|
      format.html
      format.csv { send_data @landlords.to_csv, filename: "#{Date.today}-landlords.csv" }
    end
  end

  def show
    @landlord = Landlord.find(params[:id])
    @bookings = @landlord.flats.extract_associated(:bookings).first
  end

  def new
    @landlord = Landlord.new
  end

  def create
    @landlord = Landlord.new
    if @landlord.save
      redirect_to landlords_path
    else
      render :new
    end
  end

  def import
    count = Landlord.import params[:file]
    redirect_to landlords_path, notice: "Imported #{count} landlords"
  end

  private

  def landlord_params
    params.require(:landlord).permit(:first_name, :last_name, :photo, :email, :notes, :id_number, :id_type, :cif, :street, :number, :postal_code, :city, :country, :nationality, :company_name, :phone, :iban)
  end
end
