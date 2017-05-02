class OrdersController < ApplicationController
  #before_action :skip_pundit?

  # GET the current user past orders
  def index
    # Check if the user is signed in
    if user_signed_in?
      # Depending on the user type, get a different set of orders
      if current_user.type == "Customer"
        # Get all orders made by the customer
        @orders = current_user.orders.all
      elsif current_user.type == "Manager"
        # Check if the manager selected an specific event or all of them
        @event = params[:event_id].empty? ? nil : current_user.events.find(params[:event_id])
        # Get all orders from all events for the manager or only orders from the event selected by the manager, respectively
        @orders = @event.nil? ? current_user.orders.where.not(status: "Pendente") : @event.orders.where.not(status: "Pendente")
      end
    else
      # If the user is not signed in, redirect to login page
      redirect_to new_user_session_path
    end
  end

  # GET the order, details, and all other info related to it
  def show
    # Find order by its id
    @order = Order.find(params[:id])
    # Get order details where the quantity of the product is not zero
    @order_details =  @order.order_details.where.not(quantity: 0)
    # Set soma initially equal to zero
    soma = 0
    # For each order detail, add the product price times the product quantity to soma
    @order_details.each do |ord|
      soma += ord.product.price * ord.quantity
    end
    # Update order total amount equal to soma
    @order.update(:amount => soma)
  end

  # GET events to start a new order
  def event_select
    # Get all events from database
    # TODO: Get only future events and close to the customer current location
    @events = Event.all
  end

  # GET sections from the selected event
  def section_select
    # Find section selected by its id
    @event = Event.find(params[:event_id])
    # Get the event sections
    @sections = @event.sections
  end

  # GET products from the selected section
  def products_select
    # Find section selected by its id
    @section = Section.find(params[:section])
    # Get the products available in that section
    @products = @section.products
    # Separate products in foods and beverages
    @foods = @products.select{ |prod| prod.is_food }
    @beverages = @products.reject{ |prod| prod.is_food }
    # Create empty order object
    @order = Order.new
    # Build empty order details objects for the new order
    @order.order_details.build
    # Create empty customer profile object for the new order
    @order.customer_profile = CustomerProfile.new
  end

  # POST the selected products and seat info to create a new order
  def create
    # Create and order with all the params from the form and its fields
    @order = Order.new(order_params)

    # I am still scared to erase this...
    # @customer_profile = CustomerProfile.new(order_params[:customer_profile_attributes])
    # order_params[:order_details_attributes].each { |k, od| @order.order_details.build(od)}
    # @customer_profile.save!
    # @order.customer_profile = @customer_profile
    # raise

    # Save created_atd order in database
    if @order.save
      # After order is saved, redirect to order show page
      redirect_to order_path(@order)
    else
      # TODO: finding out why it didn't save and notify the user
      #render 'products_select'
    end
  end

  private

  # Strong params
  def order_params
    params.require(:order).permit(:customer_profile_attributes => [:seat_info_1, :seat_info_2, :section_id, :customer_id], :order_details_attributes => [:order_id, :product_id, :quantity])
  end
end
