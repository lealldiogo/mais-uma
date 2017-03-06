class CreateCustomerProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_profiles do |t|
      t.references :section, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true
      t.string :seat_info_1
      t.string :seat_info_2
      t.timestamps
    end
  end
end
