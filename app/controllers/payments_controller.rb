class PaymentsController < ApplicationController
  before_action :set_order

  def new
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @order.amount_centavos, # or amount_pennies
      description:  "Pagamento  Mais Uma ",
      currency:     @order.amount.currency
    )

    @order.update(payment: charge.to_json, status: 'Pago')
    redirect_to order_path(@order)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_order_payment_path(@order)
  end

  private

  def set_order
    @order = Order.where(status: 'Pendente').find(params[:order_id])
  end
end
