class ProductsController < ApplicationController

  before_action :set_params, only: [:edit, :show]

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result
  end
  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      flash[:notice] = "product created succesfully"
      redirect_to @product
    else
      render 'new'
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

  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :user_id, images: [])
  end

  def set_params
    @product = Product.find(params[:id])
  end

end
