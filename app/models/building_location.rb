class BuildingLocation < ApplicationRecord
  def adress
    "#{city}, #{street}, #{zip_code}"
  end
end
