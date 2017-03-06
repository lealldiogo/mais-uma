class Event < ApplicationRecord
  has_many :sections
  has_many :orders, through: :sections
  belongs_to :manager
end
