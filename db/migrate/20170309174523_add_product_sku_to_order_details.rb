class AddProductSkuToOrderDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :order_details, :product_sku, :string
  end
end
