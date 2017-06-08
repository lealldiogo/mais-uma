class Manager < User
  has_many :events
  has_many :orders, through: :events
  has_many :products_stocks, through: :events
end
