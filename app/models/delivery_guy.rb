class DeliveryGuy < User
  belongs_to :section
  has_many :orders
end
