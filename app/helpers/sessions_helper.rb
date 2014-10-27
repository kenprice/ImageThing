module SessionsHelper
  # logs in user using session method
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  # ||= means OR EQUALS
  # a = b || a is equivalent to a||= b 
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    #is the user logged in? current_user == nil if not logged in
    !current_user.nil?
  end
end
