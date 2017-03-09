class AddAmountToOrderDetails < ActiveRecord::Migration[5.0]
  def change
    add_monetize :order_details, :amount, currency: { present: false }
  end
end
