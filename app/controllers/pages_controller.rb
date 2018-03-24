class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about, :terms_of_service, :privacy_policy]

  def home
    @user = current_user
  end

  def about
  end

  def terms_of_service
  end

  def privacy_policy
  end
end
