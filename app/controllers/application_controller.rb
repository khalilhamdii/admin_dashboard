class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
end
  def after_sign_in_path_for(resource)
    if current_user.admin_role?
     portal_path
    else
      dashboard_path
    end
    
  end
end
