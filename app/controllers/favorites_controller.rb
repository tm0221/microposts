class FavoritesController < ApplicationController
  before_action :logged_in_user
    
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @favorite = current_user.favorites.build(micropost: @micropost)
 
    if @favorite.save
      #redirect_to root_url
	  else
	    redirect_to root_url, alert: "error"
	  end
	end
  
  def destroy
    @favorite = current_user.favorites.find_by!(micropost_id: params[:micropost_id])
    @favorite.destroy
    #redirect_to root_url
  end
end

