Rails.application.routes.draw do

  get 'home/index'

  devise_for :users
  resources :notes do 
    collection do
      get :tag_cloud
    end
  end
  resources :todos

  root 'home#index'
end
