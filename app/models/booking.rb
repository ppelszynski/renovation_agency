class Booking < ApplicationRecord
  belongs_to :company
  belongs_to :building_location

  validate :company_available
  validate :dates

  private

  def company_available
    company.bookings.each do |booking|
      errors.add(:date_from, 'Date is not available.') if booking.date_to >= date_from || booking.date_from >= date_to
    end
  end

  def dates
    errors.add(:date_to, 'Deadline must be after start') if date_to < date_from
  end
end
