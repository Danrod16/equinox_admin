class ApplicationController < ActionController::Base
  include Pundit
  before_action :set_locale
  before_action :authenticate_user!
  before_action :check_subdomain
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def check_subdomain
    unless user_signed_in? && request.subdomain == current_user.subdomain
      redirect_to root_url(subdomain: current_user.subdomain), alert: "You are not authorized to access that subdomain."
    end
  end

  def set_locale
    if user_signed_in?
      I18n.locale = current_user.language
    else
      I18n.locale = params[:lang] || locale_from_header || I18n.default_locale
    end
  end

  def locale_from_header
    request.env.fetch('HTTP_ACCEPT_LANGUAGE', '').scan(/[a-z]{2}/).first
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

  def after_sign_up_path_for(resource)
    root_url(subdomain: resource.subdomain)
  end

  def after_sign_in_path_for(resource)
    root_url(subdomain: resource.subdomain)
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
