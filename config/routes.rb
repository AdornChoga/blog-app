Rails.application.routes.draw do
  devise_for :users,defaults: { format: :html }
  
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end
  namespace :api do
    devise_for :users, defaults: { format: :json },
                     class_name: 'ApiUser',
                           skip: [:registrations, :invitations,
                                  :passwords, :confirmations,
                                  :unlocks],
   
    
  end
end
