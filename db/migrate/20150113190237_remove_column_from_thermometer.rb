class RemoveColumnFromThermometer < ActiveRecord::Migration
  def change
    remove_column :thermometers, :temperature_id, :integer
  end
end
