class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end  

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages #storing errors in the cookies and displays them in the views layout between the original page and the newly rendered page
      render :new
    end    
  end  

  def user_params
    params.require(:user).permit(:user_name)
  end  

end
