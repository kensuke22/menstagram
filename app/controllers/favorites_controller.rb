class FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    ramen_image = RamenImage.find(params[:ramen_image_id])
    favorite = current_user.favorites.new(ramen_image_id: ramen_image.id)
    favorite.save
    # render :create
  end

  def destroy
    ramen_image = RamenImage.find(params[:ramen_image_id])
    favorite = current_user.favorites.find_by(ramen_image_id: ramen_image.id)
    favorite.destroy
    # render :destroy
  end
end
