class AddUserForeignKeys < ActiveRecord::Migration
  def change
  	add_column :thermometers, :user_id, :integer
  	add_index :thermometers, :user_id, :integer
  end
end
