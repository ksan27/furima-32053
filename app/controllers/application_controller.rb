class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nickname, :email, :birthday, :first_name, :last_name, :first_name_reading, :last_name_reading]
    )
  end
end
