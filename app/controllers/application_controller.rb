class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :set_locale

  def set_locale
    if user_signed_in?
      I18n.locale = current_user.language&.to_sym || I18n.default_locale
    else
      I18n.locale = params[:lang] || locale_from_header || I18n.default_locale
    end
  end

  def locale_from_header
    request.env.fetch('HTTP_ACCEPT_LANGUAGE', '').scan(/[a-z]{2}/).first
  end

  def after_sign_in_path_for(user)
    bookings_user_root_path
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :language, :role, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :language, :photo, :role])

  end

  def user_not_authorized
    flash[:alert] = "No estas autorizado para realizar esta acción"
    redirect_to(request.referrer || root_path)
  end


    def set_time_zone
      Time.zone = current_user.time_zone
    end

end

