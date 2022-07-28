class BookingsController < ApplicationController
  def index
    @bookings = Booking.all.paginate(page: params[:page], per_page: 15)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @booking.build_deposit
    @user = User.new
    @flat = Flat.new
    @tenant = Tenant.new
  end

  def create
    # Apartment:Tenant.switch!("public")
    @booking = Booking.new(booking_params)
    # @booking.user = User.find(booking_params[:booking][:user_id])
    # Apartment:Tenant.switch!(current_user.company.subdomain)
    if @booking.save
      redirect_to bookings_path
    else
      @user = User.new
      @flat = Flat.new
      @tenant = Tenant.new
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :flat_id, :user_id, :tenant_id, :deposit_registry, :deposit_paid, :deposit_amount, :contract_type, :rent, :payments, :state, :obligatory_complience, :appliences, :agency_fee, :itp, :check_in_notes, deposit_attributes: [:state, :amount, :token_payment])
  end
end
