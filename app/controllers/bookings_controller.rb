class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @user = User.new
    @flat = Flat.new
    @tenant = Tenant.new
  end

  def create
    @booking = Flat.new(booking_params)
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:boooking).permit(:start_date, :end_date, :user_id, :flat_id, :tenant_id, :deposit_registry, :deposit_paid, :deposit_amount, :contract_type, :rent, :payments, :state, :obligatory_complience, :appliences, :agency_fee, :itp, :check_in_notes)
  end
end
