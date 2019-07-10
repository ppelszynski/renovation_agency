FactoryBot.define do
  factory :building_location do
    sequence(:city) { |n| "Example City #{n}" }
    sequence(:street) { |n| "Example Street #{n}" }
    sequence(:zip_code) { |n| "43-#{300 + n}" }
  end
end
