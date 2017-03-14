class ProductsController < ApplicationController
  def index
    @event = params[:event_id].empty? ? nil : current_user.events.find(params[:event_id])
    @products = Product.all
    @foods = @products.select{ |prod| prod.is_food }
    @beverages = @products.reject{ |prod| prod.is_food }
  end

  def show
    @event = params[:event_id].empty? ? nil : current_user.events.find(params[:event_id])
    @product = Product.find(params[:id])
    @products_stocks = @event.nil? ? @product.products_stocks : @product.products_stocks.select { |ps| ps.section.event == @event }
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  private

  def product_params
   params.require(:product).permit(:price)
  end
end
