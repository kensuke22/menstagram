class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @users = User.all
  end
  
  
  def show
    @user = User.find(params[:id])
    @ramen_images = @user.ramen_images.page(params[:page]).reverse_order
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  private
  
  def user_params
  params.require(:user).permit(:username, :profile_image, :profile)
  end
  
  def correct_user
    user = User.find(params[:id])
    redirect_to root_url if current_user != user
  end
  
end
