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

