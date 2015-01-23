class AddThermometerRefToReadings < ActiveRecord::Migration
  def change
		add_column :readings, :thermometer_id, :integer
  end
end
