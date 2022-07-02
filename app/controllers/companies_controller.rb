class CompaniesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create, :find, :join ]

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

  def find
    @company = Company.find_by(name: params[:name])
    render json: @company
  end

  def join
    @company = Company.find_by(name: params[:name])
    if @company.present?
      redirect_to new_user_registration_url(subdomain: @company.subdomain)
    end
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
