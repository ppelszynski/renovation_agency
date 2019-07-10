require 'rails_helper'

describe BookingsController, type: :controller do
  describe '#CREATE' do
    it 'can not create with overlaping dates' do
      company = create(:company)

      company.bookings.create(building_location_id: 1, date_from: DateTime.now, date_to: DateTime.now.next_month)

      expect { company.bookings.create(building_location_id: 1, date_from: DateTime.now.tomorrow, date_to: DateTime.now.next_month) }.not_to change { Booking.count }
    end
  end
end
