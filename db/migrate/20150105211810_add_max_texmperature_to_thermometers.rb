class AddMaxTexmperatureToThermometers < ActiveRecord::Migration
  def change
    add_column :thermometers, :max_temp, :float
  end
end
