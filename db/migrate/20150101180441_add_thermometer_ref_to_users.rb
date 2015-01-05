class AddThermometerRefToUsers < ActiveRecord::Migration
  def change
  	create_table :thermometers do |t|
    t.belongs_to :users, index:true
    t.add_reference :users, :thermometer, index: true
  end
end
