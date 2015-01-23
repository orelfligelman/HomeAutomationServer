class RemoveThermometerFromReadings < ActiveRecord::Migration
  def change
    remove_reference :readings, :thermometer, index: true
  end
end
