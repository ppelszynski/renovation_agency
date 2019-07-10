class BuildingLocation < ApplicationRecord
  has_many :bookings

  def adress
    "#{city}, #{street}, #{zip_code}"
  end
end
