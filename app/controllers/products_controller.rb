class ProductsController < ApplicationController

  # GET products from a managers specific event or all events
  # Do we need to select an event for that? All products are being selected from database
  def index
    # Check if the manager selected an specific event or all of them
    @event = params[:event_id].empty? ? nil : current_user.events.find(params[:event_id])
    # Get all products from database
    @products = Product.all
    # Separate products in foods and beverages
    @foods = @products.select{ |prod| prod.is_food }
    @beverages = @products.reject{ |prod| prod.is_food }
  end

  # GET information about a product and its stocks
  def show
    # Check if the manager selected an specific event or all of them
    @event = params[:event_id].empty? ? nil : current_user.events.find(params[:event_id])
    # Find product by its id
    @product = Product.find(params[:id])
    # Get stocks for the product in the event selected
    @products_stocks = @event.nil? ? @product.products_stocks : @product.products_stocks.select { |ps| ps.section.event == @event }
  end

  # GET a product to edit its price
  def edit
    # Find product by its id
    @product = Product.find(params[:id])
  end

  # PUT/PATCH product price
  def update
    # Find product by its id
    @product = Product.find(params[:id])
    if @product.update(product_params)
      # If update successful go to product show page
      redirect_to product_path(@product)
    else
      # If something goes wrong re-render product edit page
      render :edit
    end
  end

  private

  # Strong params
  def product_params
   params.require(:product).permit(:price)
  end
end
