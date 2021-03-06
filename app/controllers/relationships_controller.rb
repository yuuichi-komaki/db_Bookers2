class RelationshipsController < ApplicationController
 def follow
  current_user.follow(params[:id])
  redirect_back(fallback_location: root_url)
 end

 def unfollow
  current_user.unfollow(params[:id])
  redirect_back(fallback_location: root_url)
 end
 
  # def followings
  #   @user = User.find(params[:id])
  #   @users = @user.followings
  # end

  # def followers
  #   @user = User.find(params[:id])
  #   @users = @user.followers
  # end


  # private
  # def 
    # @user = User.find(params[:user_id])
  # end



end
