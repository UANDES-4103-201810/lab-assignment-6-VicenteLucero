class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index

  end

  def current_user
    user = User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      redirect_to users_path
    else
      flash.now[:danger] = 'Invalid combination of email/password'
      render 'new'
    end
  end

  def is_user_logged_in?
	#complete this method
  	logged_in = false
	if logged_in then true else redirect_to root_path end 
  end
end
