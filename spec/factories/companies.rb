FactoryBot.define do
  factory :company do
    sequence(:name) { |n| "Example Company #{n}" }
  end
end
