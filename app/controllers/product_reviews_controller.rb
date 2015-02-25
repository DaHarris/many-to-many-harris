class ProductReviewsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @product_review = ProductReview.new
  end

  def create
    @product = Product.find(params[:product_id])
    if current_user
      @product_review = ProductReview.new(product_review_params)
      @product_review.user_id = current_user.id
      @product_review.product_id = @product.id
      if !@product_review.valid?
        render :new
      else
        @product_review.save
        redirect_to reviews_path, notice: "Review was successfully created."
      end
    else
      redirect_to login_path, notice: "User must be logged in to review products."
    end
  end

  private

  def product_review_params
    params.require(:product_review).permit(:title, :description, :rating)
  end


end
