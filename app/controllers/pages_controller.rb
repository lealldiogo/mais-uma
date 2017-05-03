class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def partner_kpi
    @event = Event.find(params[:event_id])
  end

  def kpi_revenue_generated
    @event = Event.find(params[:event_id])
    @total_revenue = get_total_revenue
  end

  def get_total_revenue
    total_revenue = 0
    @event.orders.each do |order|
      sum = 0
      order.order_details.each { |od| sum += od.product.price * od.quantity}
      total_revenue += sum
      print total_revenue
    end
    return total_revenue
  end

  def home
  end

  def about_us
  end

  def contacts
  end
end
