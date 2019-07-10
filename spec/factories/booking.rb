FactoryBot.define do
  factory :booking do
    company { create(:company) }
    building_location { create(:building_location) }
    date_from { DateTime.now }
    date_to { date_from + 5.days }
  end
end
