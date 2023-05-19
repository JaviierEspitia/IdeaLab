class ProductsController < ApplicationController

  before_action :set_product, only: [:edit, :show, :update, :destroy]
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(products_params)
    if @product.save
      flash[:success] = "Product created"
      redirect_to products_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @product.update(products_params)
      redirect_to products_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show

  end

  def destroy
    if @product.destroy
      flash[:success] = "El producto se elimino"
      redirect_to products_path, status: :see_other
    else
      redirect_to products_path
    end
  end

  private

  def set_product
    @product = Product.friendly.find(params[:id])
  end

  def products_params
    params.require(:product).permit(:name, :description, :visible)
  end
end
