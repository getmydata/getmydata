class ReviewsController < ApplicationController

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

  private


  def review_params
    params.require(:review).permit(:comment, :like)
  end
end

