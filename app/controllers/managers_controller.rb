class ManagersController < ApplicationController



def kpi_index

end

def total_revenue
  total_revenue = 0
  event.orders.each do |order|
  sum = 0
  order.order_details.each { |od| sum += od.product.price * quantity}
  sum
  total_revenue += sum
  return total_revenue
end

def demand_overview
  order.group_by_minute(:created_at).count
  return {created_at:order.group_by_minute(:created_at).count}
end

def delivery_guy_ranking
  order.group_by_delivery
end


def order_details

  #display piechart based on number of product.count in orders.
  #<% pie_chart Yogurt.group(:flavor).count %>

end

def customer_profiles
#Order details per section of the stadium
#To build in details later
end

def stand_reports


end



def
