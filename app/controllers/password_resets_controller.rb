class PasswordResetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :update, :edit]

  def new
    skip_authorization
  end

  def create
    skip_authorization
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to root_url, :notice => "Email sent with password reset instructions."
  end

  def edit
    skip_authorization
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    skip_authorization
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
    elsif @user.update_attributes(user_params)
      redirect_to root_url, :notice => "Password has been reset!"
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:email, :id)

  end
end
