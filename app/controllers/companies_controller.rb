class CompaniesController < ApplicationController

  def index
    policy_scope(Company)
    if params[:query].present?
      results = PgSearch.multisearch(params[:query])
      @companies = []
      results.each do |result|
        @companies << result.searchable
      end
    else
      @companies = Company.all
    end
  end

  def show
    @company = Company.find(params[:id])
    authorize @company
  end

  def new
    @company = Company.new
    authorize @company
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
  end

  def company_params
  end
end

