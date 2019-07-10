FactoryBot.define do
  factory :booking do
    company { create(:company) }
    building_location { create(:building_location) }
    date_from { Datetime.now }
    date_to { Datetime.now + 5.days }
  end
end
