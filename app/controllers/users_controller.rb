class UsersController < ApplicationController
  def profile
    @user = current_user
    authorize @user

    respond_to do |format|
      format.html
      format.pdf do
        pdf = ProfilePdf.new(@user)
        send_data pdf.render, filename: "MyData.pdf",
        type: "application/pdf",
        disposition: "inline"
      end
    end
  end

  def delete_avatar
    @user = current_user
    authorize @user

    @user.remove_avatar!
    @user.avatar = Rails.root.join("app/assets/images/user.png").open
    @user.save!
    flash[:notice] = "Avatar deleted"
    redirect_to profile_path
  end

    def delete_identification
    @user = current_user
    authorize @user

    @user.remove_identification!
    @user.identification = Rails.root.join("app/assets/images/id-card.png").open
    @user.save!
    flash[:notice] = "Avatar deleted"
    redirect_to profile_path
  end


end

