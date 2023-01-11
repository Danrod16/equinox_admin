class UpdateBookingJob < ApplicationJob
  queue_as :default

  def perform(user_id, booking_id)
    # Do something later
    current_user = User.find(user_id)

    Apartment::Tenant.switch!(current_user.company.subdomain)
    booking = Booking.find(booking_id)
    booking.update(state: 'Cerrada') if booking.end_date.to_date <= Date.today
  end
end
