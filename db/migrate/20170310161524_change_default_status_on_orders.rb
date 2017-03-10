class ChangeDefaultStatusOnOrders < ActiveRecord::Migration[5.0]
  def up
    change_column_default(:orders, :status, "Pendente")
  end

  def down
    change_column_default(:orders, :status, "Feito")
  end
end
