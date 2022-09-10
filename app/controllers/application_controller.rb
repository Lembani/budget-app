class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: %i[index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    user_categories_path(current_user.id)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email password password_confirmation name])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password])
  end
end
