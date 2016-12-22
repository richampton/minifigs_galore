class SessionsController < ApplicationController
	def create
		@user = User.find_by_email(params[:email])
		puts '~~~~~~~~~~~~~~','pe',session[:email],'sid',session[:user_id],'uid',@user.id
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
      session[:part_type]         = nil
      session[:part_search]       = nil
      session[:form_name]         = nil
      session[:form_note]         = nil
      session[:part_type]         = nil
      session[:head_id]           = nil
      session[:head_img_url]      = nil
      session[:head_part_id]      = nil
      session[:head_desc]         = nil
      session[:torso_id]          = nil
      session[:torso_img_url]     = nil
      session[:torso_part_id]     = nil
      session[:torso_desc]        = nil
      session[:leg_id]            = nil
      session[:leg_img_url]       = nil
      session[:leg_part_id]       = nil
      session[:leg_desc]          = nil
      session[:accessory_id]      = nil
      session[:accessory_img_url] = nil
      session[:accessory_part_id] = nil
      session[:accessory_desc]    = nil
		redirect_to "/users/new"
	end
end