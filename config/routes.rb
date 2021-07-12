Rails.application.routes.draw do
  get 'users/show'
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root to: "home#top"
  resources :ramen_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :ramen_comments, only: [:create, :destroy]
    
  end
  
end
