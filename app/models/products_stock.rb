class ProductsStock < ApplicationRecord
  belongs_to :section
  belongs_to :product

  def self.stands
    all.map(&:stand).uniq
  end
end
