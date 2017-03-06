class RenameUsersRefOnTables < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :user_id, :manager_id
    rename_column :customer_profiles, :user_id, :customer_id
  end
end
