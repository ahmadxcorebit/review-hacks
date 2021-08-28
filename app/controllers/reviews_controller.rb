class ReviewsController < ApplicationController

  before_action :set_product, only: [:create]

  def new
    @review = @product.reviews.new
  end

  def create
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id
    respond_to do |format|
      if @review.save
        format.html { redirect_to @product, notice: 'Review was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
        format.js
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:user_review, :product_id, :user_id)
  end

  def set_product
    @product = Product.find(params[:review][:product_id])
  end

end
