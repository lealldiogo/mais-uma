class ProductsStock < ApplicationRecord
  belongs_to :section
  belongs_to :product

  validates :quantity, presence: true

  def self.stands
    all.map(&:stand).uniq
  end
end
