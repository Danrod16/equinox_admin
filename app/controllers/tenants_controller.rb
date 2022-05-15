class TenantsController < ApplicationController

  def index
    if params[:query].present?
      @tenants = Tenant.search_by_first_name_and_last_name_and_address(params[:query])
    else
      @tenants = Tenant.all
    end
  end

end

