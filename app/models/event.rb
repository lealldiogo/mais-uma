class Event < ApplicationRecord
  has_many :sections
  belongs_to :manager
end
