class ReviewsController < ApplicationController

  def index
    @company_reviews = CompanyReview.all
    @product_reviews = ProductReview.all
    @user = current_user
  end

end
