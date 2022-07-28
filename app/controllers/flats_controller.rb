class FlatsController < ApplicationController
  def index
    if params[:query].present?
      @flats = Flat.search_by_name_or_street(params[:query]).paginate(page: params[:page], per_page: 15)
    else
      @flats = Flat.all.paginate(page: params[:page], per_page: 15)
    end

    respond_to do |format|
      format.html
      format.csv { send_data @flats.to_csv, filename: "#{Date.today}-flats.csv" }
    end
  end

  def import
    count = Flat.import params[:file]
    redirect_to flats_path, notice: "Imported #{count} flats"
  end

  def show
    @flat = Flat.find(params[:id])
    @bookings = @flat.bookings.paginate(page: params[:page], per_page: 15)
  end

  def new
    @flat = Flat.new
    @landlord = Landlord.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      if request.referer.include? "bookings"
        render json: @flat.attributes
      else
        redirect_to flats_path
      end
    else
      render :new
    end

    # respond_to do |format|
    #   if @item.save
    #     format.html { redirect_to @item, notice: 'Item was successfully created.' }
    #     format.json { render json: @item }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @item.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  private

  def flat_params
    params.require(:flat).permit(:celula, :catastral, :index, :cee, :expenses, :insurance, :insurance_phone, :keys, :equinox_costs, :photos, :video, :furnished, :landlord_id, :available, :name, :reference, :street, :number, :postal_code, :city, :country, :letter_box, :reference_rent, :habitability_number, :catastral_number)
  end
end
