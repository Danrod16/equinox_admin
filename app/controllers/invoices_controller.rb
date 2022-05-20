class InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      redirect_to invoices_path
    else
      render :new
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:booking_id, :state, :fianza, :total, :supplements)
  end
end
