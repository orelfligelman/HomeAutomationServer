class AddReadingRefToThermometer < ActiveRecord::Migration
  def change
    add_reference :thermometers, :temperature, index: true
  end
end
