class AddUserRefToThermometer < ActiveRecord::Migration
  def change
    add_column :thermometers, :email, :string
  end
end
