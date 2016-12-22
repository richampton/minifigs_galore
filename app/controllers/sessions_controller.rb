class SessionsController < ApplicationController
	def create
		@user = User.find_by_email(params[:email])
		if  @user and @user.email == params[:email]
			session[:user_id] = @user.id
			redirect_to "/minifigs/#{@user.id}"
		else
			flash[:errors] = ["Invalid combination"]
			redirect_to "/users/new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to "/users/new"
	end
end