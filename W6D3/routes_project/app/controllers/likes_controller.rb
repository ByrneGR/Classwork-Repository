class LikesController < ApplicationController
    def index
        if params.has_key?("artwork_id")
           @likes = Like.where(likeable_id: params[:artwork_id]).where(likeable_type: "Artwork")
        elsif params.has_key?("comment_id")
            @likes = Like.where(likeable_id: params[:comment_id]).where(likeable_type: "Comment")
        end
        render json: @likes
    end

    def create
    likes = Like.new(like_params)
        if likes.save
            render json: likes
        else
            render json: likes.errors.full_messages, status: :unprocessable_entity
        end
    end


    def destroy
        @like = Like.find(params[:id])
        @like.destroy
        render json: @like
        #redirect_to users_url
    end


    private

    def like_params
        params.require(:like).permit(:user_id, :likeable_id, :likeable_type)
    end 



end