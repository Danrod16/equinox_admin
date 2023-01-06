class SettingsController < ApplicationController
  def dashboard
    @flats = Flat.all

    @markers = @flats.geocoded.map do |flat|
      last_booking = flat.bookings.last

      image = if last_booking.present? && last_booking.state == 'Abierta'
                (last_booking.end_date.to_date > (Date.today + 7.days)) ? helpers.asset_url("home-rent.png") : helpers.asset_url("home-soon.png")
              else
                helpers.asset_url("home-available.png")
              end
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window: render_to_string(partial: "flats/info_window", locals: { flat: flat }),
        image_url: image
      }
    end

    @sales_monthly = Booking.where("start_date >= ?", "01-01-#{Time.now.year}").group("SUBSTRING(start_date, 6, 2)").sum(:agency_fee)
    @sales_this_year = @sales_monthly.values.sum
    @sales_monthly = @sales_monthly.map { |k, v| [k.to_i, v.to_i] }.to_h
    # state = open / closed
    @booking_status = Booking
                        .where("start_date <= ? AND end_date >= ?", "31-12-#{Time.now.year}", "01-01-#{Time.now.year}")
                        .group(:state)
                        .count
    @user_booking_status = Booking
                        .where("user_id = ? AND start_date <= ? AND end_date >= ?", current_user.id, "31-12-#{Time.now.year}", "01-01-#{Time.now.year}")
                        .group(:state)
                        .count
    @top_five_flats = Flat
                        .select("flats.*, SUM(bookings.agency_fee) AS flats_count")
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
