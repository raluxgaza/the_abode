class AddNameToRent < ActiveRecord::Migration
  def change
    add_column :rents, :name, :string
  end
end
