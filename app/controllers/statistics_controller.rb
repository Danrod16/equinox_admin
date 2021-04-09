class StatisticsController < ApplicationController
  def index
    authorize :statistics, :index?
    @total_rent_earnings = []
    Booking.all.each do |booking|
      @total_rent_earnings << booking.subtotal
    end
  end

  private
  def find_current_year

  end
end
