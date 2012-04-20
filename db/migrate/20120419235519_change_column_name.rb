class ChangeColumnName < ActiveRecord::Migration
  def up
    rename_column :properties, :type, :type_id
  end

  def down
  end
end
