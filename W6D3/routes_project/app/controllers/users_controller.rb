class UsersController < ApplicationController
    def index
    #   @users = User.all
    #   render json: @users
        query_string = params[:username]
        if params.keys.length > 2
            #@users = User.where("users.username LIKE '%#{query_string}%'")
            @users = User.where("users.username LIKE ?","%#{query_string}%")
        else
            @users = User.all
        end             
        render json: @users 
    end

    def create
        user = User.new(params.require(:user).permit(:username))
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

        # self.update
        # @user = User.find(params[:id])
        # render json: @user

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to user_url(@user)
        else
          render json: @user.errors.full_messages, status: 422
        end
    end

    def favorites
      @favorites = Artwork.where(artist_id: params[:id]).where(artist_favorite: true)
      render json: @favorites
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        render json: @user
        #redirect_to users_url
    end


    private

    def user_params
        params.require(:user).permit(:username)
    end 



end