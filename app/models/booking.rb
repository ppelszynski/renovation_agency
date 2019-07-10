class Booking < ApplicationRecord
  def building_location
    BuildingLocation.find(building_location_id)
  end

  def company
    Company.find(company_id)
  end
end
