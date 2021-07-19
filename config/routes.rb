Rails.application.routes.draw do
  devise_for :users
  root to: "home#top"
  resources :ramen_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :ramen_comments, only: [:create, :destroy]
    
  end
  resources :users, only: [:show, :edit, :update, :index]
  
  get 'search/search' => 'search#search'
  
end
