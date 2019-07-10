class CreateBuildingLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :building_locations do |t|
      t.string :city
      t.string :street
      t.string :zip_code

      t.timestamps
    end
  end
end
