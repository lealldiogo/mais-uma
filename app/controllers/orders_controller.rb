class OrdersController < ApplicationController
  def index
    if current_user.type == "Customer"
      @orders = current_user.orders
    elsif current_user.type == "Manager"
      event = current_user.events.first
      @orders = event.customer_profiles.collect { |customer| customer.orders } }
    end
  end
end
