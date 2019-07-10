require 'rails_helper'

feature 'bookings' do
  context 'user' do
    scenario 'can create booking' do
      create(:company, name: 'Example Company')
      create(:building_location, city: 'Example City', street: 'Example Street', zip_code: '43-300')

      visit root_path

      click_on 'Bookings'
      click_on 'Add booking'

      select 'Example Company', from: 'booking[company_id]'
      select 'Example City, Example Street, 43-300', from: 'booking[building_location_id]'

      click_button 'Create booking'

      expect(page).to have_table_row('Example City, Example Street, 43-300')
      expect(page).to show_notification('Booking created.')
    end

    scenario 'can see bookings' do
      company = create(:company, name: 'Selleo')
      create(:booking, company: company)

      visit root_path

      click_on 'Bookings'

      expect(page).to have_table_row('Selleo')
    end
  end
end
