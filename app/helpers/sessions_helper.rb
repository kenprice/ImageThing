module SessionsHelper
  # logs in user using session method
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  #current logged in user
  def current_user
  # ||= means OR EQUALS
  # a = b || a is equivalent to a||= b 
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    #is the user logged in? current_user == nil if not logged in
    !current_user.nil?
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
  
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end
