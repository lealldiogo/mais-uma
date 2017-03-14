class AddAwayTeamLogoToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :away_team_logo, :string
  end
end
