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

    scenario 'can see invalid dates errors' do
      create(:company, name: 'Example Company')
      create(:company, name: 'Another Company')
      create(:building_location, city: 'Example City', street: 'Example Street', zip_code: '43-300')

      visit root_path

      click_on 'Bookings'
      click_on 'Add booking'

      select 'Example Company', from: 'booking[company_id]'
      select 'Example City, Example Street, 43-300', from: 'booking[building_location_id]'

      select_date_from('2019', 'July', '10')
      select_date_to('2019', 'August', '20')

      click_button 'Create booking'

      expect(page).to have_table_row('Example City, Example Street, 43-300')
      expect(page).to show_notification('Booking created.')

      click_on 'Add booking'

      select 'Example Company', from: 'booking[company_id]'
      select 'Example City, Example Street, 43-300', from: 'booking[building_location_id]'

      select_date_from('2019', 'July', '15')
      select_date_to('2019', 'August', '25')

      click_button 'Create booking'

      expect(page).to show_notification('Company is busy in this time.')
      expect(page).to show_field_error('Date from is not available.')
    end
  end
end
