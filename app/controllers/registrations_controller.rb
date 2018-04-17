class RegistrationsController < ApplicationController
	def new
	
	end

	def create
	    user = User.create!(create_params)
		  if user.save!
				redirect_to log_in_path

			else
				flash.now[:danger] = "Invalid combination"
				redirect_to registrations_path
			end

	end

	private
		def create_params
			params.require(:registrations).permit(:name, :last_name, :email, :phone, :password)
		end
end
