class CompaniesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create, :find, :join ]
  skip_before_action :verify_authenticity_token
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to new_user_registration_url(subdomain: @company.subdomain)
    else
      render :new
    end
  end

  def update
    @company = current_user.company
    @company.update(company_params)
    if @company.save
      redirect_to root_url(subdomain: @company.subdomain)
    end
  end

  def find
    @company = Company.where("lower(name) = ? AND validated = ?", params[:name].downcase, true).first
    render json: @company
  end

  def join
    @company = Company.where("lower(name) = ? AND validated = ?", params[:name].downcase, true).first
    if @company.present?
      redirect_to new_user_registration_url(subdomain: @company.subdomain)
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :logo)
  end
end
