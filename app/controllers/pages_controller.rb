class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def partner_kpi
    @event = Event.find(params[:event_id])
  end

  def kpi_revenue_generated
    @event = Event.find(params[:event_id])
    @total_revenue = get_total_revenue[-1][1]
    @orders_revenues = get_total_revenue
  end

  def get_total_revenue
    total_revenue = 0
    sorted_orders = @event.orders.sort_by { |order| order.created_at.hour }
    orders_revenues = [["Hour", "Total Revenue R$"]]
    sorted_orders.each do |order|
      sum = 0
      order.order_details.each { |od| sum += od.product.price_centavos * od.quantity}
      total_revenue += sum
      orders_revenues << [order.created_at.hour, total_revenue]
    end
    # orders_revenues.sort_by! { |order_revenue| order_revenue[0] }
    # orders_revenues.insert(0,["Datetime", "Revenue Generated R$"])
    return orders_revenues
  end

  def kpi_delivery_ranking
    @delivery_guys = DeliveryGuy.all
  end

  def home
  end

  def about_us
  end

  def contacts
  end
end
