# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @company = Company.find_by(subdomain: request.subdomain)
    super
  end

  # POST /resource
  def create
    @company = Company.find_by(subdomain: request.subdomain)
    super
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    # super(resource)
    if resource.company.validated
      root_url(subdomain: resource.company.subdomain)
    else
      sign_out resource
      flash[:notice] = "Thank you for registering. Your team is under review."
      root_path
    end
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    flash[:notice] = "Your request has been sent. Waiting for the admin's confirmation."
    root_path
    # super(resource)
  end
end
