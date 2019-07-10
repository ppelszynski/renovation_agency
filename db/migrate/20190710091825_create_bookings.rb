class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :company
      t.references :building_location
      t.datetime :date_from
      t.datetime :date_to

      t.timestamps
    end
  end
end
