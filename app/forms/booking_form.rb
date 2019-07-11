class BookingForm < Patterns::Form
  param_key 'booking'

  attribute :company_id, String
  attribute :building_location_id, String
  attribute :date_from, DateTime
  attribute :date_to, DateTime

  validates :company_id, presence: true
  validates :building_location_id, presence: true
  validate :company_available
  validate :date_period

  private

  attr_reader :resource

  def persist
    resource.update_attributes(attributes)
  end

  def company_available
    Company.find(attributes[:company_id]).bookings.each do |booking|
      errors.add(:date_from, 'is not available.') if booking.date_to >= date_from || booking.date_from >= date_to
    end
  end

  def date_period
    errors.add(:date_to, 'must be after start') if attributes[:date_to] < attributes[:date_from]
  end
end
