Rails.application.routes.draw do
  devise_for :users,
  defaults: { format: :html },
  path: ''
                
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

  namespace :api do
    devise_for :users,
    defaults: { format: :json },
    class_name: 'ApiUser',
    skip: [
    :registrations, :invitations,
    :passwords, :confirmations,
    :unlocks
    ],
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout'
    },
    controllers: {
      sessions: 'api/sessions'
    }

    devise_scope :user do
      get 'login', to: 'devise/sessions#create'
      delete 'logout', to: 'devise/sessions#destroy'
    end
  end
end
