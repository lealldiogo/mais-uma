class AddHomeTeamLogoToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :home_team_logo, :string
  end
end
