class BookingForm < Patterns::Form
  param_key 'booking'

  attribute :company_id, String
  attribute :building_location_id, String
  attribute :date_from, DateTime
  attribute :date_to, DateTime

  private

  attr_reader :resource

  def persist
    resource.update_attributes(attributes)
  end
end
