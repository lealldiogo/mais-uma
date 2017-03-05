class AddEventToSections < ActiveRecord::Migration[5.0]
  def change
    add_reference :sections, :event, foreign_key: true
  end
end
