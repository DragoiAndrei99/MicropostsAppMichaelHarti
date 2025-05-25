Rails.application.routes.draw do
  get "static_pages/home"
  get "static_pages/help"
  devise_for :auth_accounts, controllers: {
    sessions: 'auth_accounts/sessions',
    registrations: 'auth_accounts/registrations',
    passwords: 'auth_accounts/passwords'
  }


  resources :microposts
  resources :users
  root "static_pages#home"
  get "/help", to: "static_pages#help"
end
