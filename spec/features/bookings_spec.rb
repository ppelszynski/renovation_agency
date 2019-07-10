require 'rails_helper'

feature 'bookings' do
  context 'user' do
    scenario 'can create booking' do
      visit root_path

      click_on 'Bookings'
      click_on 'Add booking'

      select 'Example City, Example Street, 43-300', from: 'booking[building_location]'
      select 'Example Company', from: 'booking[company]'

      fill_in 'Start date', with: Datetime.now
      fill_in 'Deadline', with: (Datetime.now + 5.days)

      click_button 'Create booking'

      expect(page).to have_table_row('New City, New Street 1, 43-300')
      expect(page).to show_notification('Location created.')
    end
  end
end
