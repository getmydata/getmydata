class UserselectionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:select, :create ]

  def select
    @user_selection = UserSelection.new
    @user_selections = UserSelection.all
    @companies = Company.all

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

    @user_selection.user_id = current_user.id
    @user_selection.company_id = params["user_selection"]["company_id"].to_i
    @user_selection.save
  end

  def create
    @companies = Company.all
    @user_selection = UserSelection.new(user_selection_params)
    @user_selection.user_id = current_user.id
    @selection_array = []
    @user_selections = UserSelection.where(user: current_user)
    if @user_selections.present?
     @user_selections.each do |selection|
      @selection_array << selection
    end
  end
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
    # authorize current_user
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

 # @companies.each do |company|
    #   company = company.delete(@selection_array)
    #   @companies << company
    # end
