class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all

    @invoices = @invoices.where(sequence: params[:sequence]) if params[:sequence].present?
    @invoices = @invoices.where(state: params[:state]) if params[:state].present?
    @invoices = @invoices.where(booking_id: params[:booking]) if params[:booking].present?

    @invoices = @invoices.paginate(page: params[:page], per_page: 15)

    respond_to do |format|
      format.html
      format.text { render partial: 'shared/table_rows', locals: { headers: Invoice::INVOICE_HEADERS, records: @invoices }, formats: [:html] }
    end
  end

  def new
    @invoice = Invoice.new
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      redirect_to invoices_path
    else
      render :new
    end
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:id])
    if @invoice.update(invoice_params)
      redirect_to invoice_path(@invoice)
    else
      render :edit
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:booking_id, :state, :fianza, :total, :supplements)
  end
end
