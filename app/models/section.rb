class Section < ApplicationRecord
  belongs_to :event
  has_many :products_stocks
end
