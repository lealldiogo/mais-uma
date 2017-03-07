class CustomerProfile < ApplicationRecord
  has_many :orders
  belongs_to :customer
  belongs_to :section

  validates :seat_info_1, :seat_info_2, presence: true
end
