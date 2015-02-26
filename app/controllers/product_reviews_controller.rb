class ProductReviewsController < ApplicationController
  before_action :authenticate

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

  def edit
    @product = Product.find(params[:product_id])
    @product_review = @product.product_reviews.find(params[:id])
  end

  def update
    @product = Product.find(params[:product_id])
    @product_review = @product.product_reviews.find(params[:id])
    if !@product_review.valid?
      render :edit
    else
      if @product_review.update(product_review_params)
        redirect_to reviews_path, notice: "Review was successfully updated."
      else
        render :edit
      end
    end
  end

  private

  def authenticate
    if !@current_user
      redirect_to root_path, notice: "You must be logged in to review products."
    end
  end

  def product_review_params
    params.require(:product_review).permit(:title, :description, :rating)
  end


end
