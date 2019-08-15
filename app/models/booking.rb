class Booking < ApplicationRecord
  belongs_to :company
  belongs_to :building_location
end
