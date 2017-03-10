class AddDeliveryGuyToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :user, foreign_key: true
    rename_column :orders, :user_id, :delivery_guy_id
  end
end
