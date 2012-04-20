class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.integer :location
      t.integer :type
      t.binary :legal_docs, :limit => 10.megabyte

      t.timestamps
    end
  end
end
