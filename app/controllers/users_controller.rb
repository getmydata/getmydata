class UsersController < ApplicationController
  def profile
    @user = current_user
    # authorize @user
  end

  # def show
  #   @user = current_user

  #   respond_to do |format|
  #     format.pdf do
  #       render pdf: "file_name_of_your_choice",
  #       template: "users/show.pdf.erb",
  #       locals: {:user => @user}
  #     end
  #   end
  # end

end

