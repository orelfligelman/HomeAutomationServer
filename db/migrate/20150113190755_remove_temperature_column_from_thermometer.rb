class RemoveTemperatureColumnFromThermometer < ActiveRecord::Migration
  def change
    remove_column :thermometers, :temperature, :integer
  end
end
