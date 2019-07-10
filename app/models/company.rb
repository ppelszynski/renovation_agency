class Company < ApplicationRecord
  has_many :bookings

  def bookings
    Booking.where(company_id: id)
  end
end
