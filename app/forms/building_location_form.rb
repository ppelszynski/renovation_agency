class BuildingLocationForm < Patterns::Form
  param_key 'building_location'

  attribute :city, String
  attribute :street, String
  attribute :zip_code, String

  attr_reader :resource

  private

  def persist
    resource.update_attributes(attributes)
  end
end
