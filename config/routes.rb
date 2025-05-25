Rails.application.routes.draw do
  resources :microposts
  resources :users
  resources :users do
    member do
      get :microposts
    end
  end
  root "static_pages#home"
  get "/help", to: "static_pages#help"
end
