module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
    session[:session_token] = user.session_token
  end
  # Forgets session.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Remember session
  def remember(user)
    user.remember
    cookies.permanent.encrypted[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

   # Logs out the current user.
   def log_out
    forget(current_user)
    reset_session
    @current_user = nil
  end

  # Returns the current logged-in user (if any).
  def current_user
    if (user_id = session[:user_id])
      user = User.find_by(id: user_id)
      if user && session[:session_token] == user.session_token
        @current_user = user
      end
    elsif (user_id = cookies.encrypted[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def current_user?(user)
    user && user == current_user
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

   # Stores the URL trying to be accessed.
   def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end