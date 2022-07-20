class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :register, :set_language ]
  skip_before_action :verify_authenticity_token
  def home

  end

  def styleguide
  end

  def register
    session[:wizard] = nil
    @model = :wizard
    @user = User.new
    @user.build_company
  end

  def set_language
    @user = current_user
    if @user&.update!(language: params[:lang]) && user_signed_in?
      redirect_back fallback_location: root_path
    else
      redirect_to root_path(lang: params[:lang])
    end
  end
end
