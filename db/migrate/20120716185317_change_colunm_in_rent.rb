class ChangeColunmInRent < ActiveRecord::Migration
  def up
    rename_column :rents, :payment, :payment_status
  end

  def down
  end
end
