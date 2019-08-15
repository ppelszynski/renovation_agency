module CapybaraHelper
  def accept_dialog_box
    page.driver.browser.switch_to.alert.accept
  end

  def select_date_from(year, month, day)
    select year, from: 'booking[date_from(1i)]'
    select month, from: 'booking[date_from(2i)]'
    select day, from: 'booking[date_from(3i)]'
  end

  def select_date_to(year, month, day)
    select year, from: 'booking[date_to(1i)]'
    select month, from: 'booking[date_to(2i)]'
    select day, from: 'booking[date_to(3i)]'
  end
end
