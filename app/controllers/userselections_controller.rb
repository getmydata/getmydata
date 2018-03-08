class UserselectionsController < ApplicationController
  def select
    @user_selection = UserSelection.new
    @user_selections = UserSelection.all
    @companies = Company.all

    if params[:query].present?
      results = PgSearch.multisearch(params[:query])
      @companies = []
      authorize @companies
      results.each do |result|
        @companies << result.searchable
      end
    else
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
