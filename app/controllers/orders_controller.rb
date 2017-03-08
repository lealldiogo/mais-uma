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
    @event = Event.find(params[:event_id])
    @sections = @event.sections
  end

  def products_select
    @section = Section.find(params[:section])
    @products = @section.products
  end

  def confirmation

  end

  def order_params
    params.require(:order).permit(:atr1, :atr2, :order_details_attributes => [:atr1, :atr2])
  end
end
