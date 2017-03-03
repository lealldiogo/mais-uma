class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :away_team
      t.string :home_team
      t.datetime :datetime
    end
  end
end
