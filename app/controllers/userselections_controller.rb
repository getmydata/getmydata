class UserselectionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:select, :create, :destroy]

  def select
    @user_selection = UserSelection.new
    @user_selections = UserSelection.all
    @companies = Company.all

    gon.companies = @companies

    @categories = @companies.map {|z| p z.category}
    @unique_categories = @categories.uniq{|x| p x}

    policy_scope(Company)
    if params[:query].present?
      @companies = Company.search_by_name_and_category(params[:query])
      authorize @companies
    else
      @companies = Company.all
      authorize @companies
    end

    @selection_array = []
    if @user_selections.present?
      @user_selections.each do |selection|
        @selection_array << selection
      end
    end
  end

  def new
    authorize current_user
    policy_scope(UserSelection)

    @user_selection = UserSelection.new

    user_signed_in? ? @user_selection.user_id = current_user.id : @user_selection.user_id = session[:guest_user_id]
    @user_selection.company_id = params["user_selection"]["company_id"].to_i
    @user_selection.save
  end

  def create
    # Create new user selection
    @companies = Company.all
    @user_selection = UserSelection.new(user_selection_params)
    user_signed_in? ? @user_selection.user_id = current_user.id : @user_selection.user_id = session[:guest_user_id]
    @selection_array = []
    user_signed_in? ? user_selections = UserSelection.where(user_id: current_user.id) : user_selections = UserSelection.where(user_id: session[:guest_user_id])
    if @user_selections.present?
      @user_selections.each do |selection|
        @selection_array << selection
      end
    end

    # Create a list of unselected companies and enable AJAX
    @unselected_companies = []
    @companies.each do |company|
      if @selection_array.include?(company)
        @unselected_companies << company
      end
    end

    authorize @user_selection
    if @user_selection.save
      respond_to do |format|
        format.html { redirect_to select_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'userselections/select'}
        format.js
      end
    end
  end

  def destroy
    @user_selection = UserSelection.find(params[:id])
    @user_selection.destroy
    authorize @user_selection
    policy_scope(UserSelection)
  end

  private

  def user_selection_params
    params.require(:user_selection).permit(:company_id)
  end
end
