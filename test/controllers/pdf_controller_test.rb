require 'test_helper'

class PdfControllerTest < ActionDispatch::IntegrationTest
  test "should get booking_pdf" do
    get pdf_booking_pdf_url
    assert_response :success
  end

end
