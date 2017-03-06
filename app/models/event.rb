class Event < ApplicationRecord
  has_many :sections
  has_many :customer_profiles, through: :sections
  belongs_to :manager
end
