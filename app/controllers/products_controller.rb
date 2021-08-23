class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
       flash[:notice] = "product created succesfully"
       redirect_to @product
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
       flash[:notie] = "update succesfully"
       redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy

  end

  def show
    @product =Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :image, :user_id)
  end

end
