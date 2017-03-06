class Section < ApplicationRecord
  belongs_to :event
  has_many :products_stocks
  has_many :delivery_guys
end
