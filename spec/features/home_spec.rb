require 'rails_helper'

feature 'home' do
  context 'user' do
    scenario 'sees top 5 companies' do
      create(:booking, company: create(:company, name: '1'))
      create(:booking, company: create(:company, name: '2'))
      create(:booking, company: create(:company, name: '3'))
      create(:booking, company: create(:company, name: '4'))
      create(:booking, company: create(:company, name: '5'))
      create(:booking, company: create(:company, name: '6'))

      visit root_path

      expect(page).to have_table_row(%w[1 2 3 4 5 6])
    end

    scenario 'can see bookings' do
      company = create(:company, name: 'Selleo')
      create(:booking, company: company)

      visit root_path

      click_on 'Bookings'

      expect(page).to have_table_row('Selleo')
    end

    scenario 'can see top 5 companies' do
      create(:booking, company: create(:company, name: '1'))
      create(:booking, company: create(:company, name: '2'))
      create(:booking, company: create(:company, name: '3'))
      create(:booking, company: create(:company, name: '4'))
      create(:booking, company: create(:company, name: '5'))
      create(:booking, company: create(:company, name: '6'))

      visit root_path

      expect(page).to have_table_row(%w[1 2 3 4 5 6])
    end

    scenario 'can see bookings' do
      company = create(:company, name: 'Selleo')

      create(:booking, company: company)

      visit root_path

      click_on 'Bookings'

      expect(page).to have_table_row('Selleo')
    end

    scenario 'can see top 5 companies' do
      create(:booking)
      create(:booking)

      visit root_path

      expect(page).to have_css('.this_month', text: '2')
    end

    scenario 'can see bookings starting next month' do
      company = create(:company, name: 'Selleo')

      create(:booking, company: company, date_from: DateTime.now.next_month)

      visit root_path

      expect(page).to have_css('.next_month', text: '1')
    end
  end
end
