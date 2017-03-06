class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|
      t.integer :quantity
      t.references :order, foreign_key: true, index: true
      t.references :product, foreign_key: true, index: true
      t.timestamps
    end
  end
end
