require 'rails_helper'

feature 'building locations' do
  context 'user' do
    scenario 'can create building location' do
      visit root_path

      click_on 'Building locations'
      click_on 'Add location'

      fill_in 'City', with: 'New City'
      fill_in 'Street', with: 'New Street 1'
      fill_in 'Zip code', with: '43-300'

      click_button 'Create location'

      expect(page).to have_table_row(['New City', 'New Street 1', '43-300'])
      expect(page).to show_notification('Location created.')
    end

    scenario 'can see building locations' do
      FactoryBot.create_list(:building_location, 3)

      visit root_path

      click_on 'Building locations'

      expect(page).to have_table_row ['Example City 1', 'Example City 2', 'Example City 3']
      expect(page).to have_table_row ['Example Street 1', 'Example Street 2', 'Example Street 3']
    end

    scenario 'can edit building locations' do
      create(:building_location)

      visit root_path

      click_on 'Building locations'

      click_on 'Edit'

      fill_in 'City', with: 'Edited city'

      click_button 'Update location'

      expect(page).to have_table_row 'Edited city'
      expect(page).to show_notification('Location updated.')
    end

    scenario 'can delete building location' do
      create(:building_location, city: 'Wrong City')

      visit root_path

      click_on 'Building locations'

      click_link 'Delete'

      accept_dialog_box

      expect(page).to show_notification('Location deleted.')
      expect(page).not_to have_table_row('Wrong City')
    end
  end
end
