class FavoritesController < ApplicationController
  before_action :logged_in_user
    
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @favorite = current_user.favorites.build(micropost: @micropost,micropost_id: @micropost.id)
    
    if @favorite.save
      redirect_to :back 
    else
      redirect_to :back, alert: "error"
    end
  end
  
  def destroy
    @favorite = current_user.favorites.find_by(micropost_id: params[:micropost_id])
    @favorite.destroy
    redirect_to :back 
  end
end

