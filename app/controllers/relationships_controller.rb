class RelationshipsController < ApplicationController
  
  
  def followlist
    @user = User.find(params[:user_id])
  end
  
  def followerlist
     @user = User.find(params[:user_id])
  end
  
  def create
  current_user.follow(params[:id])
  redirect_to request.referrer
  end

  def destroy
    current_user.unfollow(params[:id])
    redirect_to request.referrer
  end

end
