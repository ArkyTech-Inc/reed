Rails.application.routes.draw do
  get 'rooms/index'
  resources :posts
  devise_for :users
  resources :pins
  resources :rooms
  resources :chat, only: [:create], defaults: { format: :json }
 # get 'home/index'
  root "home#index"
  #root "pins#index"
  get 'home/about'
  get 'home/pin'
  


  devise_scope :user do
    get "users", to: "devise/sessions#new"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
