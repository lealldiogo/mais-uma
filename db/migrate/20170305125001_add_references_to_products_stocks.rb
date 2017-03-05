class AddReferencesToProductsStocks < ActiveRecord::Migration[5.0]
  def change
    add_reference :products_stocks, :product, foreign_key: true
    add_reference :products_stocks, :section, foreign_key: true
  end
end
