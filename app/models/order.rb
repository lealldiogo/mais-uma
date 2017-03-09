class Order < ApplicationRecord
  belongs_to :customer_profile
  has_many :order_details, inverse_of: :order
  accepts_nested_attributes_for :order_details, :customer_profile
  monetize :amount_centavos
end
