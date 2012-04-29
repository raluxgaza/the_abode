class ChangePropertiesLocationName < ActiveRecord::Migration
  def up
    rename_column :properties, :location, :address
  end

  def down
  end
end
