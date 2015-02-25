class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
    @company = @product.company
    @product_reviews = @product.product_reviews
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "Product was successfully created."
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :company_id)
  end
end
