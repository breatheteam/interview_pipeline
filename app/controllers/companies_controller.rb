class CompaniesController < ApplicationController

  #before_action :authenticate_user!

  def create
    @company = Company.create
  end

end
