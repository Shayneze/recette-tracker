Rails.application.routes.draw do
  resources :recipes do
    resources :reviews, only: [:create, :edit, :update, :destroy]
  end
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
