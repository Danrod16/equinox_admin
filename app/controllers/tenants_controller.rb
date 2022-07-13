class TenantsController < ApplicationController

  def index
    if params[:query].present?
      @tenants = Tenant.search_by_first_name_and_last_name_and_address(params[:query]).paginate(page: params[:page], per_page: 15)
    else
      @tenants = Tenant.all.paginate(page: params[:page], per_page: 15)
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

  def show
    @tenant = Tenant.find(params[:id])
    @bookings = @tenant.bookings
  end

  def destroy
    @tenant = Tenant.find(params[:id])
    if @tenant.destroy
      redirect_to tenants_path
    end
  end

  private

  def tenant_params
    params.require(:tenant).permit(:first_name, :last_name, :email, :phone, :description, :photo, :street, :street_2, :number, :postal_code, :city, :country, :id_number, :id_type, :cif, :nationality)
  end
end
