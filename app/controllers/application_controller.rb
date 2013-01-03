class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  layout :layout_by_resource
	def after_sign_out_path_for(resource_or_scope)
	  new_user_session_path
	end

	protected

  def layout_by_resource
    if user_signed_in?
      "application"      
    else
      "devise_layout"
    end
  end
end
