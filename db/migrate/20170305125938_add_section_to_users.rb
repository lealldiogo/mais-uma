class AddSectionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :section, foreign_key: true
  end
end
