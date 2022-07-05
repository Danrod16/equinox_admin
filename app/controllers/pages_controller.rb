class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :register ]

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
    if @user.update!(language: params[:lang])
      redirect_back fallback_location: root_path
    end
  end
end
