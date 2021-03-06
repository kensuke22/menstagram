class RamenImagesController < ApplicationController
  
  def new
    @ramen_image = RamenImage.new
  end
    #投稿データ保存とバリデーション
  def create
    @ramen_image = RamenImage.new(ramen_image_params)
    @ramen_image.score = Language.get_data(ramen_image_params[:caption])
    @ramen_image.user_id = current_user.id
    if @ramen_image.save
      redirect_to ramen_images_path
    else
      render :new
    end
  end

  def index
    @ramen_images = RamenImage.page(params[:page]).reverse_order
  end

  def show
    @ramen_image = RamenImage.find(params[:id])
    @ramen_comment = RamenComment.new
    @user = @ramen_image.user
  end

  def destroy
    @ramen_image = RamenImage.find(params[:id])
    @ramen_image.destroy
    redirect_to ramen_images_path
  end

  private
  
  def ramen_image_params
    params.require(:ramen_image).permit(:shop_name, :image, :caption, :address, :taste, :tax_price, :evaluation)
  end

end
