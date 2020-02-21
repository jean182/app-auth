class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
  end

  def authenticate_user!
    return if user_signed_in?

    flash[:error] = "You don't have the permissions to do this!"
    redirect_to root_path
  end

  def authenticate_auditor!
    return if user_signed_in? && current_user.auditor?

    flash[:error] = "You don't have the permissions to do this!"
    redirect_to root_path
  end
end
