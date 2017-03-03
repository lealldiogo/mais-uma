class AddStandToProductsStocks < ActiveRecord::Migration[5.0]
  def change
    add_column :products_stocks, :stand, :string
  end
end
