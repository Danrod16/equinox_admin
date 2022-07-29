class SettingsController < ApplicationController

  def dashboard
    @flats = Flat.all

    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window: render_to_string(partial: "flats/info_window", locals: { flat: flat }),
        image_url: helpers.asset_url("map-pin.svg")
      }
    end
    @sales_monthly = Booking.where("start_date >= ?", "01-01-#{Time.now.year}").group("SUBSTRING(start_date, 6, 2)").sum(:agency_fee)
    @sales_this_year = @sales_monthly.values.sum
    @sales_monthly = @sales_monthly.map{|k,v| [k.to_i, v.to_i]}.to_h
    # state = open / closed
    @booking_status = Booking.group(:state).count
    @top_five_flats = Flat
                        .select("flats.*, COUNT(bookings.id) AS flats_count")
                        .joins(:bookings)
                        .group("flats.id")
                        .order("flats_count DESC")
                        .distinct
                        .limit(5)
  end

  def setting
    @members = User.where(company: current_user.company)
    @company = current_user.company
    @user = current_user
    @template = DocumentTemplate.new
  end

  def update_user
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "Your profile has been updated."
      redirect_to setting_path
    else
      render :setting
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo)
  end
end
