class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :mobile_no
      t.string :department
      t.belongs_to :user, index:true
      t.timestamps
    end
  end
end
