class SubsController < ApplicationController
    before_action :ensure_logged_in

  def new
    @sub = Sub.new
    render :new
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end  
  
  def index
    @subs = Sub.all
    render :index
  end 
  
  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      render :show
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end  
  end
  
  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end
  
  def update
    @sub = Sub.find(params[:id])
    if @sub.moderator_id == current_user.id  
      if @sub.update(sub_params)
        render :show
      else
        flash[:errors] = @sub.errors.full_messages
        render :edit
      end
    else  
    flash[:errors] = ['You are not the moderator!']
    render :edit
    end 
  end
  
  def sub_params
    params.require(:sub).permit(:title, :details)
  end  

end
