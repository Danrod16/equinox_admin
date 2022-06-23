class CompaniesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create ]

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save!
      redirect_to new_user_registration_url(subdomain: @company.subdomain)
    else
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:company_name)
  end
end
