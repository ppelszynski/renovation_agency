class BuildingLocationDecorator < Draper::Decorator
  delegate_all

  def adress
    "#{city}, #{street}, #{zip_code}"
  end
end
