class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception 
  before_filter :configure_permitted_parameters, if: :devise_controller?
 
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in)        { |u| u.permit(:first_name, :last_name, :email, :avatar_name, :password, :password_confirmation, :current_password) }
    devise_parameter_sanitizer.for(:sign_up)        { |u| u.permit(:first_name, :last_name, :email, :avatar_name, :password, :password_confirmation, :current_password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email, :avatar_name, :password, :password_confirmation, :current_password) }
  end
  
   def check_auth
     authenticate_or_request_with_http_basic do |username,password|
       resource = User.where("email = ?", username ).first
       if !resource.nil? && resource.valid_password?(password)
         sign_in :user, resource
       end
     end
   end
end
