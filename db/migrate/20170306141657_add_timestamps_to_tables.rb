class AddTimestampsToTables < ActiveRecord::Migration[5.0]
  def change
    add_timestamps :events
    add_timestamps :sections
    add_timestamps :products
    add_timestamps :products_stocks
  end
end
