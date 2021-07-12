class FavoritesController < ApplicationController
  def create
    ramen_image = RamenImage.find(params[:ramen_image_id])
    favorite = current_user.favorites.new(ramen_image_id: ramen_image.id)
    favorite.save
    redirect_to ramen_image_path(ramen_image)
  end

  def destroy
    ramen_image = RamenImage.find(params[:ramen_image_id])
    favorite = current_user.favorites.find_by(ramen_image_id: ramen_image.id)
    favorite.destroy
    redirect_to ramen_image_path(ramen_image)
  end
end
