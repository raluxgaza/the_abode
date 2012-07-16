class CreateRentalProperties < ActiveRecord::Migration
  def change
    create_table :rental_properties do |t|
      t.integer :property_id
      t.integer :rent_id

      t.timestamps
    end
  end
end
