class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    added_attrs = [:first_name, :last_name, :mobile, :account_type]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
  end

end
