class AddReadingRefToThermometers < ActiveRecord::Migration
  def change
    add_reference :thermometers, :reading, index: true
  end
end
