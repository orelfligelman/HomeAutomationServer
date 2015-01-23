class RemoveUpdateFromThermometer < ActiveRecord::Migration
  def change
    remove_column :thermometers, :update, :boolean
  end
end
