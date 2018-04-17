class SessionsController < ApplicationController
	def new
	end

	def create
		user =  User.authenticate(params[:session][:email], params[:session][:password])
		if user.nil?
			flash[:error] = "Invalid email/password combination"
			render :new
		else
			log_in user
			redirect_to user
		end
	end

	def destroy
		def destroy
			session[:current_user_id] = nil
			flash[:notice] = "You have successfully logged out."
			redirect_to root_url
		end
	end
end
