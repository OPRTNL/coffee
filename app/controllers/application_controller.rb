class ApplicationController < ActionController::Base
  # config.action_view.embed_authenticity_token_in_remote_forms = true
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :debug_before
  after_action  :debug_after

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password,
      :password_confirmation, :remember_me, :photo, :photo_cache, :remove_photo) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password,
      :password_confirmation, :current_password, :photo, :photo_cache, :remove_photo) }
  end

  def debug_before
    ap "je suis dans debug_before"
  end

  def debug_after
    ap "je suis dans debug_after"
  end

end
