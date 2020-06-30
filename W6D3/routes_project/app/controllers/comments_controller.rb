class CommentsController < ApplicationController
    def index
      if params.has_key?(:user_id) #localhost:3000/users/22/comments
        @comments = Comment.where(user_id: params[:user_id])

      elsif params.has_key?(:artwork_id)    #localhost:3000/artworks/3/comments
        @comments = Comment.where(artwork_id: params[:artwork_id])
      end    
      render json: @comments
    end

    def create
    comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end


    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        render json: @comment
        #redirect_to users_url
    end


    private

    def comment_params
        params.require(:comment).permit(:user_id, :artwork_id, :body)
    end 



end