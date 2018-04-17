class SessionsController < ApplicationController
	def new
	end

	def create
		if user = User.authenticate(params[:username], params[:password])
			session[:current_user_id] = user.id
			redirect_to users_path
		end
	end

	def destroy
		def destroy
			session[:current_user_id] = nil
			flash[:notice] = "You have successfully logged out."
			redirect_to log_in_path
		end
	end
end
