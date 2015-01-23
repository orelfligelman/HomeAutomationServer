class CreateJoinTableReadingThermometer < ActiveRecord::Migration
  def change
    create_join_table :readings, :thermometers do |t|
      # t.index [:reading_id, :thermometer_id]
      # t.index [:thermometer_id, :reading_id]
    end
  end
end
