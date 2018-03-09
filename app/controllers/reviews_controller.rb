class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
   @reviews = Review.all
  end

  def show
    @company = Company.find(params[:company_id])
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
    @review.company = @company
  end

  def update
    # only authorization for admin
    @company = Company.find(params[:company_id])
    @review.company = Company.find(params[:company_id])
    @review.update(review_params)
    redirect_to company_path(@company)
  end

  def destroy
    @review.destroy
    @company = Company.find(params[:company_id])
    redirect_to company_path(@company), :alert => "Review deleted"
  end

  private

  def set_review
    @review = Review.find(params[:id])
    authorize @review
  end

  def review_params
    params.require(:review).permit(:comment, :like)
  end
end
