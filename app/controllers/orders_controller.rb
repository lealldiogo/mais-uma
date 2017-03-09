class OrdersController < ApplicationController
  #before_action :skip_pundit?

  def index
    if user_signed_in?
      if current_user.type == "Customer"
        @orders = current_user.orders
      elsif current_user.type == "Manager"
        event = current_user.events.first
        @orders = event.orders
      end
    else
      redirect_to new_user_session_path
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
    @foods = @products.select{ |prod| prod.is_food }
    @beverages = @products.reject{ |prod| prod.is_food }
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
