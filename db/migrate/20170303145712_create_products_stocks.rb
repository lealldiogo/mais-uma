class CreateProductsStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :products_stocks do |t|
      t.integer :quantity
    end
  end
end
