# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    def update_resource(resource, user_params)
      if current_user.provider == 'facebook' || current_user.provider == 'google_oauth2'
        user_params.delete('current_password')
        resource.update_without_password(user_params)
      else
        resource.update_with_password(user_params)
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :description, :image)
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(
        :account_update,
        keys: %i[description image name]
      )
      devise_parameter_sanitizer.permit(
        :sign_up,
        keys: %i[description image name]
      )
    end
  end
end
