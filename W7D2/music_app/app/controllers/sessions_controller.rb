class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password]) 
    #run method from User model to find the user based on their username and password
    return nil if user.nil?
    login!(user)
    redirect_to user_url(user.email)
  end  

  def destroy
    log_out_user! #call log_out_user! which is inherited logout method from ApplicationController
    redirect_to new_session_url
  end 
  
  def new
    render :new
  end   
end  

#postman routes to test these
#session hash is the rails cookie (stores ), throw debugger in the controller to see what is in there