class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.references :manufacturer, null: false
      t.string :color, null: false
      t.string :year, null: false
      t.string :mileage, null: false
      t.text :description

      t.timestamps
    end
  end
end
