class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def styleguide
  end

  def set_language
    @user = current_user
    if @user.update!(language: params[:lang])
      redirect_back fallback_location: root_path
    end
  end
end
