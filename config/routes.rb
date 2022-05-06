Rails.application.routes.draw do
  get 'likes/create'
  get 'comments/new'
  get 'comments/create'
  get 'comment/new'
  get 'comment/create'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
