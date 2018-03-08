class ReviewsController < ApplicationController

  def index
   @reviews = Review.all
  end

  def show
    @company = Company.find(params[:company_id])
    @review = Review.find(params[:id])
    authorize @review
  end

  def new
    # we need @company in our `simple_form_for`
    @company = Company.find(params[:company_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    # we need `company_id` to asssociate review with corresponding restaurant
    @review.company = Company.find(params[:company_id])
    @review.user = current_user
    authorize @review
    @review.save
    redirect_to companies_path
  end

  def edit
    # only authorization for admin
    @company = Company.find(params[:company_id])
    @review = Review.find(params[:id])
    @review.company = @company
    authorize @review
  end

  def update
    # only authorization for admin
    @company = Company.find(params[:company_id])
    @review = Review.find(params[:id])
    @review.company = Company.find(params[:company_id])
    @review.update(review_params)
    authorize @review
    redirect_to company_path(@company)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :like)
  end
end
