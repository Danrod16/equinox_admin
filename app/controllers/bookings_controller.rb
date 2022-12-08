class BookingsController < ApplicationController
  def index
    @bookings = Booking.all

    if params[:user].present?
      @user = User.where("CONCAT(first_name, ' ', last_name) = ?", params[:user])
      @bookings = @bookings.where(user: @user)
    end

    if params[:flat].present?
      @flat = Flat.where(name: params[:flat])
      @bookings = @bookings.where(flat: @flat)
    end

    if params[:tenant].present?
      @tenant = Tenant.where("CONCAT(first_name, ' ', last_name) = ?", params[:tenant])
      @bookings = @bookings.where(tenant: @tenant)
    end

    if params[:deposit].present?
      @deposit = Deposit.where(amount: params[:deposit])
      @bookings = @bookings.where(deposit: @deposit)
    end

    @bookings = @bookings.where(state: params[:status]) if params[:status].present?

    @bookings = @bookings.paginate(page: params[:page], per_page: 15)

    respond_to do |format|
      format.html
      format.text { render partial: 'shared/table_rows', locals: { headers: Booking::TABLE_HEADERS, records: @bookings }, formats: [:html] }
    end
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
    @booking = Booking.new(booking_params)
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
