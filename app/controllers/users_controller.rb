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
end

