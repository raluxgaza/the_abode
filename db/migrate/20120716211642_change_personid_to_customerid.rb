class ChangePersonidToCustomerid < ActiveRecord::Migration
  def up
    rename_column :rents, :person_id, :customer_id
  end

  def down
    rename_column :rents, :customer_id, :person_id
  end
end
