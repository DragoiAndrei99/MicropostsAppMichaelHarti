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
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
end
