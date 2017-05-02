class DeliveryGuysController < ApplicationController

  # Are we gonna let the Delivery Guy check his past orders?

  # def order_index
  #   if user_signed_in?
  #     if current_user.type == "Delivery_guy"
  #       @orders = current_user.orders
  #     else
  #       redirect_to new_user_session_path
  #     end
  #   end
  # end

  # GET an order to be delivered
  def order_acceptance
    # Get orders made by customers in the same section and that have no delivery guy yet
    @orders = Order.where(status: "Pago", delivery_guy_id: nil).joins(:customer_profile).where("customer_profiles.section_id = ?", current_user.section_id)
    # Randomly pick one to show to display for the delivery guy
    @order = @orders.sample
  end

  # PUT/PATCH order accepted by delivery guy
  def order_acceptance_update
    # Find the order in the database by the id
    @order = Order.find(params[:order_id])

    if params[:choice] == "aprovar" && !@order.delivery_guy.present?
      # If the delivery guy accepted it, assign the order and update status
      @order.delivery_guy = current_user
      @order.status = "Coletando Itens"
      @order.save
      # Go to collect items page
      redirect_to order_picking_up_path(@order.id)
    elsif  params[:choice] == "recusar"
      # If the delivery guy refuses the order, reload order acceptance page
      redirect_to order_acceptance_path
    end
  end

  # GET the order accepted by the delivery guy and display details
  def order_picking_up
    # Find the order in the database by the id
    @order = Order.find(params[:order_id])
    # Get order details containing product and quantity info
    @order_details = @order.order_details
  end

  # PUT/PATCH order status after the items have been collected
  def order_picking_up_update
    # Find the order in the database by the id
    @order = Order.find(params[:order_id])
    # Update order status
    @order.update(status:"A caminho")
    # Go to customers seat info page
    redirect_to order_delivering_path(@order.id)
  end

  # GET customer seat info of the order to be delivered
  def order_delivering
    # Find the order in the database by the id
    @order = Order.find(params[:order_id])
    # Get order details containing seat infos
    @customer_profile = @order.customer_profile
  end

  # PUT/PATCH finally update status to delivered
  def order_delivered_update
    # Find the order in the database by the id
    @order = Order.find(params[:order_id])
    # Update order status
    @order.update(status:"Entregue")
    # Go back to order acceptance page and restart process
    redirect_to order_acceptance_path
  end
end

