class DeleteColumnFromRent < ActiveRecord::Migration
  def up
    remove_column :rents, :property_id
  end

  def down
    add_column :rents, :property_id, :integer
  end
end
