class Users::InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters
  skip_before_action :verify_authenticity_token

  def after_invite_path_for(resource)
    setting_path
  end

  protected

  # Permit the new params here.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:invite, keys: [:company_id])
  end
end
