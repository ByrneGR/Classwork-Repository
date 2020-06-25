class UsersController < ApplicationController
    def create
        user = User.new(user_params)

        if user.save
            # redirect_to users_url   
            render :index
        else
            flash.now[:errors] = user.errors.full_messages
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end  