class AddIndexManufacturerName < ActiveRecord::Migration
  def up
    add_index :manufacturers, :name, unique: true
  end

  def down
    remove_index :manufacturers, :name
  end
end
