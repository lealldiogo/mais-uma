class OrdersController < ApplicationController
  def index
    if current_user.type == "Customer"
      @orders = current_user.orders
    elsif current_user.type == "Manager"
      event = current_user.events.first
      @orders = event.orders

    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def event_select
    @events = Event.all
  end

  def section_select
    @sections = Event.find(params[:event_id]).sections
  end

  def products_select

  end

  def seat_n_basket

  end

  def confirmation

  end
end
