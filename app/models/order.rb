class Order < ApplicationRecord
  belongs_to :delivery_guy, optional: true
  belongs_to :customer_profile
  has_many :order_details, inverse_of: :order
  accepts_nested_attributes_for :order_details, :customer_profile
  monetize :amount_centavos

  # def assign_delivery_guy!
  #   busy_delivery_guys = Order.where.not(status: ["pago", "entregue"]).select(:delivery_guy_id)
  #   delivery_guys = DeliveryGuy.where.not(id: busy_delivery_guys).where(section_id: customer_profile.section_id)

  #   if delivery_guys.empty?
  #     # ManagerMailer.contrata_gente(self.id).deliver_now
  #   else
  #     self.delivery_guy = delivery_guys.sample
  #     self.save
  #   end
  # end
end
