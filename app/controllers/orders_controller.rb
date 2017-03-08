class OrdersController < ApplicationController
  #before_action :skip_pundit?

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
    @section = Section.find(params[:section_id])
    @products = @section.products
    @order = Order.new
    @order.order_details.build
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to 'confirmation'
    else
      render 'products_select'
    end
  end

  def confirmation

  end

  private

  def order_params
    params.require(:order).permit(:order_details_attributes => [])
  end
end
