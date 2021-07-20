class RamenCommentsController < ApplicationController
  def create
    ramen_image = RamenImage.find(params[:ramen_image_id])
    comment = current_user.ramen_comments.new(ramen_comment_params)
    comment.ramen_image_id = ramen_image.id
    comment.save
    # redirect_to ramen_image_path(ramen_image)
  end

  def destroy
    RamenComment.find_by(id: params[:id], ramen_image_id: params[:ramen_image_id]).destroy
    # redirect_to ramen_image_path(params[:ramen_image_id])
  end
  
  private
  def ramen_comment_params
    params.require(:ramen_comment).permit(:comment)
  end
  
end
