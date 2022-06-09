Rails.application.routes.draw do
  root "gifs#index"
  resources :gifs

  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy", :as => :logout
  get "login", to: "sessions#new"

  delete "account", to: "users#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
