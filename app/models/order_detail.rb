class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order
  monetize :amount_centavos
end
