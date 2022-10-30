Rails.application.routes.draw do
  resources :posts
  devise_for :users
  resources :pins
 # get 'home/index'
  root "home#index"
  #root "pins#index"
  get 'home/about'
  get 'home/pin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
