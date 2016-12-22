class UsersController < ApplicationController
   before_action :set_user, only: [:show, :edit, :update, :destroy]
   before_action :require_login, except: [:new, :create, :index]
   before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

   def index
   end

   def new
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
   end

   def create
      @user = User.new(user_params)
      if @user.save
         # flash[:success] = "User #{@user[:name]} #{@user[:last_name]} saved"
         session[:user_id] = User.find_by(email: @user.email).id
         redirect_to "/minifigs/#{@user.id}"
      else
         flash[:errors] = @user.errors.full_messages
         redirect_to "/users/new"
      end
   end

   def show
   end

   def update
      if @user.update(user_params)
         flash[:success] = ["User #{@user[:name]} #{@user[:last_name]} updated."]
      else
         flash[:errors] = @user.errors.full_messages
      end
      redirect_to "/users/#{@user.id}"
  end

   def destroy
      @user.destroy
      session[:user_id] = nil
      redirect_to "/users/new"
   end

   private
      def user_params
         params.require(:user).permit(:first_name, :last_name, :email, :password)
      end

      def set_user
         if session[:user_id]
            @user = User.find(session[:user_id])
         end
      end
end