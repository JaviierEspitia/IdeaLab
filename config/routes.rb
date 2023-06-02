Rails.application.routes.draw do
  resources :categories
  get 'products', to:"products#index"
  #get 'products/create'

  #get 'products/new', to:"products#new"
  #post "products", to:"products#create"
  resources :products do
    get 'search', on: :collection
    resources :comments, only: [:create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "main#welcome"
end
