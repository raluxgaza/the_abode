class ChangeRentsTable < ActiveRecord::Migration
  def up
    remove_column :rents, :start_date
    remove_column :rents, :payment_status
    remove_column :rents, :end_date
    remove_column :rents, :customer_id
    add_column    :rents, :property_id, :integer
    add_column    :rents, :description, :text, :limit => 2000
    add_column    :rents, :lease_duration, :string
  end

  def down
    remove_column :rents, :start_date
    remove_column :rents, :payment_status
  end
end
