class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	def current_user
		if session[:user_id] 
			User.find(session[:user_id])
		end
	end

	def require_login
		redirect_to '/users/new' if session[:user_id] == nil
	end

	def require_correct_user
		require_login
		user = User.find(session[:user_id])
		redirect_to "/users/#{current_user.id}" if current_user != user
  	end

	helper_method :current_user
	
end