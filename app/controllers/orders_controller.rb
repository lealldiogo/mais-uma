class OrdersController < ApplicationController
  #before_action :skip_pundit?

  def index
    if user_signed_in?
      if current_user.type == "Customer"
        @orders = current_user.orders.all

      elsif current_user.type == "Manager"
        @event = params[:event_id].empty? ? nil : current_user.events.find(params[:event_id])
        @orders = @event.nil? ? current_user.orders.where.not(status: "Pendente") : @event.orders.where.not(status: "Pendente")
      end
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_details =  @order.order_details.where.not(quantity: 0)
    soma = 0

    @order_details.each do |ord|
      soma += ord.product.price * ord.quantity
    end

    @order.update(:amount => soma)

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
    @order.customer_profile = CustomerProfile.new

  end

  def create
    @order = Order.new(order_params)
    # @customer_profile = CustomerProfile.new(order_params[:customer_profile_attributes])
    # order_params[:order_details_attributes].each { |k, od| @order.order_details.build(od)}
    # @customer_profile.save!
    # @order.customer_profile = @customer_profile
    # raise
    if @order.save
      redirect_to order_path(@order)
    else
      #render 'products_select'
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_profile_attributes => [:seat_info_1, :seat_info_2, :section_id, :customer_id], :order_details_attributes => [:order_id, :product_id, :quantity])

  end
end
