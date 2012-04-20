class CreateTypeOfProperties < ActiveRecord::Migration
  def change
    create_table :type_of_properties do |t|
      t.string :name

      t.timestamps
    end
  end
end
