class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_user
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: %i[show index faq about]

  protected
  
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || request.env['omniauth.origin'] || root_path
  end

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :admin]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def set_user
    @user = current_user
  end

end
