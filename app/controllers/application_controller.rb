class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[description name])
  end

  def authenticate_auditor!
    return if user_signed_in? && current_user.auditor?

    flash[:error] = "You don't have the permissions to do this!"
    redirect_to audit_index_path
  end

  def authenticate_inventory!
    return if user_signed_in? && current_user.inventory? || current_user.auditor?

    flash[:error] = "You don't have the permissions to do this!"
    redirect_to inventory_index_path
  end

  def authenticate_human_resources!
    return if user_signed_in? && current_user.human_resources? || current_user.auditor?

    flash[:error] = "You don't have the permissions to do this!"
    redirect_to profile_index_path
  end
end
