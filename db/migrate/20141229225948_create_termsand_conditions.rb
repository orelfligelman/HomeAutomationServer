class CreateTermsandConditions < ActiveRecord::Migration
  def change
    create_table :termsand_conditions do |t|

      t.timestamps
    end
  end
end
