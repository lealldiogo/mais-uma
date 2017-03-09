class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order, inverse_of: :order_details
  monetize :amount_centavos
end
