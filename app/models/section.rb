class Section < ApplicationRecord
  belongs_to :event
  has_many :customer_profiles
  has_many :orders, through: :customer_profiles
  has_many :products_stocks
  has_many :delivery_guys
end
