class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #login
      log_in user
      redirect_back_or user_path(user)
    else
      #login error
      flash.now[:danger] = "Invalid"
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
