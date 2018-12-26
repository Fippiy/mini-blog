class ApplicationController < ActionController::Base
  before_action :configure_permitted_sanitizer, if: :devise_controller?

  private
  def configure_permitted_sanitizer
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
