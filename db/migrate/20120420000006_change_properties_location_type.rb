class ChangePropertiesLocationType < ActiveRecord::Migration
  def up
    change_table :properties do |t|
      t.change :location, :text
    end
  end

  def down
  end
end
