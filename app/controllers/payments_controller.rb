class PaymentsController < ApplicationController
    before_action :set_order

    def new
    end

    def create
      # ...
    end

  private

    def set_order
      @order = Order.where(status: 'Pendente').find(params[:order_id])
    end
end