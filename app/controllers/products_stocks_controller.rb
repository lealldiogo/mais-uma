class ProductsStocksController < ApplicationController
  # def index
  #   @products_stocks = policy_scope(ProductsStock)
  # end

  def new
    @products_stock = ProductsStock.new
  end

  def create
    @products_stock = ProductsStock.new(products_stock_params)
    authorize @products_stock
    if @products_stock.save
      redirect_to products_stocks_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @products_stock = ProductsStock.find(params[:id])
  end

  def update
    @product = Product.find(params[:product_id])
    @products_stock = ProductsStock.find(params[:id])
    # authorize @products_stock
    if @products_stock.update(products_stock_params)
      redirect_to partner_side_path
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def products_stock_params
   params.require(:products_stock).permit(:quantity, :stand)
  end
end
