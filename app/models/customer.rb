class Customer < User
  has_many :customer_profiles
  has_many :orders, through: :customer_profiles
end
