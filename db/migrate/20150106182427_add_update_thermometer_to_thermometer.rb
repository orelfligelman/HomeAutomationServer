class AddUpdateThermometerToThermometer < ActiveRecord::Migration
  def change
		add_column :thermometers, :update_thermo, :boolean
  end
end
