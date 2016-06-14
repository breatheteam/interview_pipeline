class CompaniesController < ApplicationController
  before_action :authenticate_user!

  def index
    @companies = current_user.companies
  end

  def new
    @company = Company.new
  end

  def edit
    @company = current_user.companies.find(params[:id])
  end

  def create
    current_user.companies.create(company_params)
    redirect_to companies_path
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
