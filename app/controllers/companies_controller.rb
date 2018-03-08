class CompaniesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    policy_scope(Company)
    if params[:query].present?
      @companies = Company.search_by_name_and_category(params[:query])
    else
      @companies = Company.all
    end
  end

  def select
    policy_scope(Company)
    if params[:query].present?
      results = PgSearch.multisearch(params[:query])
      @companies = []
      authorize @companies
      results.each do |result|
        @companies << result.searchable
      end
    else
      @companies = Company.all
      authorize @companies
    end
  end

  def show
    @reviews = @company.reviews
    authorize @company
  end

  def new
    @company = Company.new
    authorize @company
  end

  def create
    @company = Company.new(company_params)
    authorize @company
    if @company.save
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def edit
    # only authorization for admin
  end

  def update
    # only authorization for admin
    @company.update(company_params)
    redirect_to company_path(@company)
  end

  def destroy
    # only authorization for admin
    @company.destroy
    redirect_to companies_path, :alert => "Organization has been deleted"
  end

  protected

  def set_company
    @company = Company.find(params[:id])
    authorize @company
  end

  def company_params
    params.require(:company).permit(:name, :identification, :identification_cache, :email, :url, :category)
  end
end

