class ModifyRentRentalProperties < ActiveRecord::Migration
  def up
    add_column :rents, :property_id, :integer
    remove_column :rental_properties, :property_id
  end

  def down
  end
end
