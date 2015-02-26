class CompanyReviewsController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @company_review = CompanyReview.new
  end

  def create
    @company  = Company.find(params[:company_id])
    if current_user
      @company_review = CompanyReview.new(company_review_params)
      @company_review.company_id = @company.id
      @company_review.user_id = current_user.id
      if !@company_review.valid?
        render :new
      else
        @company_review.save
        redirect_to companies_path
      end
    else
      redirect_to login_path, notice: "Must be logged in to review a company"
    end
  end

  def edit
    @company = Company.find(params[:company_id])
    @company_review = @company.company_reviews.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @company_review = @company.company_reviews.find(params[:id])
    if !@company_review.valid?
      render :edit
    else
      if @company_review.update(company_review_params)
        redirect_to companies_path, notice: "Company review was successfully updated."
      else
        render :edit
      end
    end
  end


  private
  def company_review_params
    params.require(:company_review).permit(:title, :description, :rating)
  end

end
