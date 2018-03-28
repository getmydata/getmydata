class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_in_path_for(resource_or_scope)
    root_path
  end

  def after_update_path_for(resource_or_scope)
    if current_user.avatar.present?
      current_user.avatar.file.delete
    end

    if current_user.identification.present?
      current_user.identification.file.delete
    end
    profile_path
  end

  def after_sign_up_path_for(resource_or_scope)
    select_path
  end
end
