class TenantsController < ApplicationController

  def index
    if params[:query].present?
      @tenants = Tenant.search_by_first_name_and_last_name_and_address(params[:query])
    else
      @tenants = Tenant.all
    end
  end

  def new
    @tenant = Tenant.new
  end

  def create
    @tenant = Tenant.new(tenant_params)
    if @tenant.save
      if request.referer.include? "bookings"
        render json: @tenant.attributes
      else
        redirect_to tenants_path
      end
    else
      render :new
    end
  end

  private

  def tenant_params
    params.require(:tenant).permit(:first_name, :last_name, :email, :phone, :description, :photo, :street, :street_2, :number, :postal_code, :city, :country, :id_number, :id_type, :cif, :nationality)
  end
end
