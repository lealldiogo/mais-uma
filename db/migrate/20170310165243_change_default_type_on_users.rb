class ChangeDefaultTypeOnUsers < ActiveRecord::Migration[5.0]
  def up
    change_column_default(:users, :type, "Customer")
  end

  def down
  end
end
