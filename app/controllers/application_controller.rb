class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		case resource
		when Admin
		 admins_users_path
		when User
		users_user_path(@user)
		end
	end

	def after_sign_up_path_for(resource)
   		 admins_users_path(resource)
  	end

	def after_sign_out_path_for(resource_or_scope)
    	if resource_or_scope == :admin
      	new_admin_session_path
    	else
      	root_path
    	end
  	end


	protected
	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender])
	end

end
