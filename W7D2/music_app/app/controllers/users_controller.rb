class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user)
    else
      render :new
    end    
  end  

  def user_params
    params.require(:user).permit(:email, :password)
  end 
  
  def new
    render :new
  end  
end  

#postman routes to test these
#session hash is the rails cookie (stores ), throw debugger in the controller to see what is in there