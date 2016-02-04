class SessionsController < ApplicationController
	# before_action :require_login, only: [:destroy]
	# before_action :require_correct_user, only: [:destroy]
	def new

	end 

	def create
		user = User.find_by(email:params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id 
			redirect_to "/events"
		else 
			flash[:error] = "Invalid Email/Password Combination"
			redirect_to "/sessions/new"
		end 
	end 

	def destroy
		session[:user_id] = nil
		render :new
	end


end
