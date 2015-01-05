class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :thermometers, :users do |t|
      # t.index [:thermometer_id, :user_id]
      # t.index [:user_id, :thermometer_id]
    end
  end
end
