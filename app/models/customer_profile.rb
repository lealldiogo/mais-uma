class CustomerProfile < ApplicationRecord
  has_many :orders
  belongs_to :customer
  belongs_to :section
end
