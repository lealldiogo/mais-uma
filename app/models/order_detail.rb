class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order, inverse_of: :order_details
  monetize :amount_centavos

  def quantity
    self[:quantity].present? ? self[:quantity] : 0
  end
end
