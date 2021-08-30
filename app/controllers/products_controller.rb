class ProductsController < ApplicationController

  before_action :set_params, only: [:edit, :show, :edit, :destroy]

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result
  end
  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.new(product_params)
    respond_to do |format|
    if @product.save
      format.html { redirect_to @product, notice: 'Product was successfully created.' }
      format.js
    end
    end
  end

  def edit; end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "update succesfully"
      redirect_to @product
    else
      render 'edit'
    end
  end

  def show
    @review = @product.reviews.build
  end

  def destroy
    @product.destroy
    redirect_to @product
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :user_id, images: [])
  end

  def set_params
    @product = Product.find(params[:id])
  end

end
