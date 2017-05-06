Rails.application.routes.draw do
  root "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/sign_up", to: "users#new"
  get "/log_in", to: "sessions#new"
  post "/sign_up", to: "users#create"
  post "/log_in", to: "sessions#create"
  delete "/log_out", to: "sessions#destroy"

  resources :users
  resources :images
end
