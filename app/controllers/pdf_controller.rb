class PdfController < ApplicationController
  def booking_pdf
    language = params[:language]
    booking = Booking.find(params[:id])
    respond_to do |format|
      format.pdf do
        pdf = BookingPdf.new(language, booking)
        send_data pdf.render, filename: "#{booking.tenant.full_name}_#{language}.pdf",
        type: "application/pdf",
        disposition: "inline"
      end
    end
  end
end
