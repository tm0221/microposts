class RetweetsController < ApplicationController
  before_action :logged_in_user
	 
  def create
    @micropostretweet = Micropost.find(params[:micropost_id])
    @micropost = current_user.microposts.build(content: "Re: "+@micropostretweet.content, avatar: @micropostretweet.avatar)
    @retweet = current_user.retweets.build(micropost: @micropost, before_id: @micropostretweet.id)
    
    if @retweet.save
      @micropost.save
    
      flash[:success] = "Retweeted!"
      redirect_to root_url
    else
      
      flash[:success] = "Error"
      redirect_to root_url
    end
  end
  
  def destroy	   
    @retweet = current_user.retweets.find_by(micropost_id: params[:micropost_id])
    @micropostretweet = current_user.microposts.find_by(id: params[:micropost_id])
    @retweet.destroy
    @micropostretweet.destroy
 
    flash[:success] = "Retweet deleted"
    redirect_to :back
  end  
end