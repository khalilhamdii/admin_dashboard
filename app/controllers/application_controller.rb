class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if current_user.admin_role?
     portal_path
    else
      dashboard_path
    end
    
  end
end
