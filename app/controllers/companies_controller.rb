class CompaniesController < ApplicationController

  before_action :authenticate_user!

  def create
    @company = User.company.create
  end

end
