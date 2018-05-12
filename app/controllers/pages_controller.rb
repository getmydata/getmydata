class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about, :terms_of_service, :cookies, :how_does_it_work]

  def home
  end

  def about
  end

  def terms_of_service
  end

  def how_does_it_work
  end

  def privacy_policy
  end
end
