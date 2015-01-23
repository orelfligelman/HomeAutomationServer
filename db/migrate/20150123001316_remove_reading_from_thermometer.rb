class RemoveReadingFromThermometer < ActiveRecord::Migration
  def change
    remove_reference :thermometers, :reading, index: true
  end
end
