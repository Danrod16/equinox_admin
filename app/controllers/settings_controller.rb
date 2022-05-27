class SettingsController < ApplicationController

  def dashboard
    @flats = Flat.all

    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window: render_to_string(partial: "flats/info_window", locals: { flat: flat }),
        image_url: helpers.asset_url("urbanist-logo.png")
      }
    end
    @sales_monthly = Invoice.where("created_at >= ?", Time.now.beginning_of_year).group('(EXTRACT(MONTH FROM created_at))::integer').sum(:total)
    @sales_this_year = @sales_monthly.values.sum
    @sales_monthly = transform_to_json(@sales_monthly)
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

  private

  def transform_to_json(hash)
    hash.collect{|k,v| [k.to_s, v.to_s]}.to_h
  end
end
