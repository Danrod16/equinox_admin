require 'csv'
class PdfController < ApplicationController
  def booking_pdf
    language = params[:language]
    booking = Booking.find(params[:id])
    signature = booking.user.photo
    respond_to do |format|
      format.pdf do
        pdf = BookingPdf.new(language, booking, signature)
        send_data pdf.render, filename: "#{booking.tenant.full_name}_#{language}.pdf",
        type: "application/pdf",
        disposition: "inline"
      end
    end
  end

  def invoice_pdf
    language = params[:language]
    invoice = Invoice.find(params[:id])
    respond_to do |format|
      format.pdf do
        pdf = InvoicePdf.new(language, invoice)
        send_data pdf.render, filename: "#{invoice.booking.tenant.full_name}_#{language}.pdf",
        type: "application/pdf",
        disposition: "inline"
      end
    end
  end

  def incident_pdf
    language = params[:language]
    incident = Incident.find(params[:id])
    respond_to do |format|
      format.pdf do
        pdf = IncidentPdf.new(incident)
        send_data pdf.render, filename: "#{incident.booking.flat.name}_#{language}.pdf",
        type: "application/pdf",
        disposition: "inline"
      end
    end
  end

  def settlement_pdf
    language = params[:language]
    settlement = Settlement.find(params[:id])
    respond_to do |format|
      format.pdf do
        pdf = SettlementPdf.new(language, settlement)
        send_data pdf.render, filename: "#{settlement.booking.flat.name}_#{language}.pdf",
        type: "application/pdf",
        disposition: "inline"
      end
    end
  end

  def custom_invoice_pdf
    language = params[:language]
    custom_invoice = CustomInvoice.find(params[:id])
    respond_to do |format|
      format.pdf do
        pdf = CustomInvoicePdf.new(custom_invoice)
        send_data pdf.render, filename: "#{custom_invoice.title}.pdf",
        type: "application/pdf",
        disposition: "inline"
      end
    end
  end

  def receipt_pdf
    receipt = Receipt.find(params[:id])
    respond_to do |format|
      format.pdf do
        pdf = ReceiptPdf.new(receipt)
        send_data pdf.render, filename: "#{receipt.booking.tenant.full_name}.pdf",
        type: "application/pdf",
        disposition: "inline"
      end
    end
  end

  def generate_landlord_csv
   respond_to do |format|
     format.csv { render :csv => Landlord.all }
   end
  end
end
