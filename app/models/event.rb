class Event < ApplicationRecord
  has_many :sections
  has_many :orders, through: :sections
  has_many :products, through: :sections
  belongs_to :manager

  validates :home_team, :away_team, presence: true
  # validates :check_dif_home_away

  # def check_dif_home_away
  #   errors.add(:away_team, "Nao pode ser o mesmo time") if home_team == away_team
  # end
end
