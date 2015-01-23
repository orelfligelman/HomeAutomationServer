class CreateThermometers < ActiveRecord::Migration
  def change
    create_table :thermometers do |t|
      t.string :name
      t.integer :temperature

      t.timestamps
    end
  end
end
