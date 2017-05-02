class ProductsStocksController < ApplicationController
  # def index
  #   @products_stocks = policy_scope(ProductsStock)
  # end

  # GET form to create a new product stock
  def new
    # Create an empty product stock
    @products_stock = ProductsStock.new
  end

  # POST new product stock by stand
  def create
    # Create a new product stock with the params
    @products_stock = ProductsStock.new(products_stock_params)
    # ??? Pundit?
    authorize @products_stock
    if @products_stock.save
      # If create successful go to products stock index page
      redirect_to products_stocks_path
    else
      # If something goes wrong re-render products stock new page
      render :new
    end
  end

  # GET a product stock to edit its quantity
  def edit
    # Find product by its id
    @product = Product.find(params[:product_id])
    # Find product stock by its id
    @products_stock = ProductsStock.find(params[:id])
  end

  # PUT/PATCH product stock quantity
  def update
    # Find product by its id
    @product = Product.find(params[:product_id])
    # Find product stock by its id
    @products_stock = ProductsStock.find(params[:id])
    # authorize @products_stock
    if @products_stock.update(products_stock_params)
      # If update successful go to manager home page
      redirect_to partner_side_path
    else
      # If something goes wrong re-render products stock edit page
      render :edit
    end
  end

  def destroy

  end

  private

  # Strong params
  def products_stock_params
   params.require(:products_stock).permit(:quantity, :stand)
  end
end
