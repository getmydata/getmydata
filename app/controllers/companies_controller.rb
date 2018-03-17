class CompaniesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :overview, :show]
  before_action :set_company, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  def after_update_path_for(resource_or_scope)
    if !params["company"]["avatar"].nil?
      current_company.avatar.file.delete
    end
    company_path
  end

  def overview
    if params[:query].present?
      @companies = Company.search_by_name_and_category(params[:query])
    else
      @companies = Company.all
    end

    authorize(@companies.first)
  end

  def show
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
    redirect_to companies_path, :alert => "Company deleted"
  end

  def upvote
    @company.upvote_from current_user
    redirect_to overview_path
  end

  def downvote
    @company.downvote_from current_user
    redirect_to overview_path
  end

  protected

  def set_company
    @company = Company.find(params[:id])
    authorize @company
  end

  def company_params
    params.require(:company).permit(:name, :avatar, :avatar_cache, :identification, :identification_cache, :email, :url, :category)
  end
end

