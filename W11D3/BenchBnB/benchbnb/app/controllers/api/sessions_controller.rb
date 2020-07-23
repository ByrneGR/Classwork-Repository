class Api::SessionsController < ApplicationController

  def destroy
    logout!
    if current_user
        render json: {}
    else
        render json: { message: 404 }
    end
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user.nil?
        render json: ['invalid credentials'], status: 401
    else
      login!(@user)
      render 'api/users/show'      
    end  
  end  
  
end