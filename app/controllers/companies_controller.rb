class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    @products = @company.products
    @reviews = @company.company_reviews
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if !@company.valid?
      render :new
    else
      if @company.save
        redirect_to companies_path, notice: "Company was succesfully created."
      else
        render :new
      end
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.valid?
      if @company.update(company_params)
        redirect_to companies_path, notice: "Company was successfully updated."
      else
        render :edit
      end
    else
      render :edit
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :catch_phrase, :suffix)
  end

end
