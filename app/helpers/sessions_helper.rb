module SessionsHelper
  
  def authenticate 
    deny_access unless signed_in?
  end
  
  def deny_access 
    store_location
    redirect_to root_path, :notice => "Please sign in!"
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end
  
  private
  
  def current_user
    @current_user = User.find( session[:user_id]) if session[:user_id]
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def clear_return_to
    session[:return_to] = nil
  end
end
