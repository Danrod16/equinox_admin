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
  end
end
