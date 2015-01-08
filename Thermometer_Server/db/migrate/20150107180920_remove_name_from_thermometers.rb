class RemoveNameFromThermometers < ActiveRecord::Migration
  def change
    remove_column :thermometers, :name, :string
  end
end
