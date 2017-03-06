class Order < ApplicationRecord
  belongs_to :customer_profile
  has_many :order_details
end
