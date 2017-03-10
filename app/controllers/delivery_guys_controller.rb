class DeliveryGuysController < ApplicationController

  # def order_index
  #   if user_signed_in?
  #     if current_user.type == "Delivery_guy"
  #       @orders = current_user.orders
  #     else
  #       redirect_to new_user_session_path
  #     end
  #   end
  # end

  def order_acceptance
    # @order = current_user.next_order
    @order = Order.all #find(params[:order_id])
  end

  def order_acceptance_update
    @order = Order.find(params[:order_id])

    if params[:status] == "aprovar"

      @order.delivery_guy = current_user
      @order.status = "coletando itens"
      @order.save

      redirect_to order_picking_up_path(@order.id)
    elsif  params[:status] == "recusar"
      redirect_to order_acceptance_path
    end
  end

  def order_picking_up
    @order = Order.find(params[:order_id])
    @order_details = @order.order_details
  end

  def order_picking_up_update
    @order = Order.find(params[:order_id])
    @order.update(status:"à caminho")
    redirect_to order_delivering_path(@order.id)
  end

  def order_delivering
    @order = Order.find(params[:order_id])
    @customer_profile = @order.customer_profile
  end

  def order_delivered_update
    @order = Order.find(params[:order_id])
    @order.update(status:"entregue")
    redirect_to order_acceptance_path
  end
end

