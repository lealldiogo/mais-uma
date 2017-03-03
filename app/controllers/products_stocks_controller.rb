class ProductsStocksController < ApplicationController
  def index
    @products_stocks = ProductsStocks.all
  end

  def new
    @products_stock = ProductsStock.new
  end

  def create
    @products_stock = ProductsStock.new(products_stock_params)
    if @products_stock.save
      redirect_to products_stocks_path
    else
      render :new
    end
  end

  def edit
    @products_stock = ProductsStock.find(params[:id])
  end

  def update
    @products_stock = ProductsStock.find(params[:id])
    if @products_stock.update(products_stock_params)
      redirect_to products_stock_path(@products_stock)
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
