class CreateRents < ActiveRecord::Migration
  def change
    create_table :rents do |t|
      t.integer :person_id
      t.integer :property_id
      t.date :start_date
      t.date :end_date
      t.decimal :amount
      t.integer :payment

      t.timestamps
    end
  end
end
