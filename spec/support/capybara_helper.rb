module CapybaraHelper
  def accept_dialog_box
    page.driver.browser.switch_to.alert.accept
  end
end
