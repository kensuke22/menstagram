class SearchController < ApplicationController
  
  def search
    @range = params[:range].to_i
    search = params[:search]
    word = params[:word]

    if @range == 1
     @user = User.search(search,word)
    else
     @ramen_image = RamenImage.search(search,word)
    end
  end
end
