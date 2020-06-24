class ApplicationController < ActionController::Base

    #Enables current_user method to be used in views
  helper_method :current_user

  def login_user!(user) #logs in user by resetting the user's session token and adding it to the session hash
    session[:session_token] = user.reset_session_token!
  end

  def current_user #creates an instance variable for current_user whish is found by their session token
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token]) #lazy - makes it so there are less database searches since you assign an instance variable after the first search
  end  
  
  def logged_in? #if the current user exists, which is when a user has a session token they are logged in
    current_user != nil
  end

  def log_out_user!
    current_user.reset_session_token! #two ways of logging out as a failsafe in case the other one doesn't work
    session[:session_token] = nil #set the session hash value to nil
    @current_user = nil #set the instance variable to nil
  end  


end
