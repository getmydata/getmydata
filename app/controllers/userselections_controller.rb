class UserselectionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:select]

  def select
    if user_signed_in?
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

    else
      @companies = Company.all
      authorize @companies
    end

  end

  def new
    authorize current_user
    policy_scope(UserSelection)

    @user_selection = UserSelection.new

    @user_selection.user_id = current_user.id
    @user_selection.company_id = params["user_selection"]["company_id"].to_i
    @user_selection.save
    redirect_to select_path
  end

  def destroy
    # authorize current_user
    @user_selection = UserSelection.find(params[:id])
    @user_selection.destroy
    authorize @user_selection
    policy_scope(UserSelection)
    redirect_to select_path
  end
end
