class Manager < User
  has_many :events
  has_many :orders, through: :events
end
