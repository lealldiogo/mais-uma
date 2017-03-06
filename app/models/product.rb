class Product < ApplicationRecord
  has_many :products_stocks
  has_many :order_details
end

