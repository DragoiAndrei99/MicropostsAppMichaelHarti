Rails.application.routes.draw do
  get "password_resets/new"
  get "password_resets/edit"
  get "sessions/new"
  resources :microposts
  resources :account_activations, only: [:edit]
  resources :users
  resources :users do
    member do
      get :microposts
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]

  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
