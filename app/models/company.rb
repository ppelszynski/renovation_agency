class Company < ApplicationRecord
  scope :today_booked, TodayBookedCompaniesQuery

  has_many :bookings
end
