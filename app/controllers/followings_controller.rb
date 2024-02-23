
class FollowingsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @user = User.find(params[:user_id])
      current_user.followees << @user
      redirect_to @user, notice: "You are now following #{@user.name}"
    end
  
    def destroy
      @user = User.find(params[:user_id])
      current_user.followees.delete(@user)
      redirect_to @user, notice: "You have unfollowed #{@user.name}"
    end
  end
  