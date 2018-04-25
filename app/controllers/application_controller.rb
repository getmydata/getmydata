class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!, :current_or_guest_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

    # if user is logged in, return current_user, else return guest_user
  def current_or_guest_user
    if current_user
      if session[:guest_user_id] && session[:guest_user_id] != current_user.id
        logging_in
        # reload guest_user to prevent caching problems before destruction
        guest_user(with_retry = false).try(:reload).try(:destroy)
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  # find guest_user object associated with the current session,
  # creating one as needed
  def guest_user(with_retry = true)
    # Cache the value the first time it's gotten.
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)
    @guest_user = User.find(session[:guest_user_id])
  rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
     session[:guest_user_id] = nil
     guest_user if with_retry
  end

  private

  # called (once) when the user logs in, insert any code your application needs
  # to hand off from guest_user to current_user.
  def logging_in
    @guest_user = User.find(session[:guest_user_id])
    guest_selections = @guest_user.user_selections
    guest_selections.each do |selection|
      selection.user_id = current_user.id
      selection.save!
    end
  end

  def create_guest_user
    u = User.new(:first_name => "firstname_#{Time.now.to_i}#{rand(100)}", :last_name => "lastname_#{Time.now.to_i}#{rand(100)}", :email => "guest_#{Time.now.to_i}#{rand(100)}@example.com", :agree_with_policy => :false)
    u.save!(:validate => false)
    session[:guest_user_id] = u.id
    u
  end

  protected

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:allow_tracking, :agree_with_policy, :admin, :avatar, :avatar_cache, :first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:allow_tracking, :avatar, :avatar_cache, :first_name, :last_name])
  end
end
