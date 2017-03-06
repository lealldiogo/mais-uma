class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :customer_profile, foreign_key: true, index: true
      t.string :status, default: "Feito"
      t.timestamps
    end
  end
end
