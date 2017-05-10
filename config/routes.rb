Rails.application.routes.draw do
  root "static_pages#home"
  get "/about", to: "static_pages#about"
  post "/search", to: "static_pages#search"
  get "/sign_up", to: "users#new"
  get "/log_in", to: "sessions#new"
  post "/sign_up", to: "users#create"
  post "/log_in", to: "sessions#create"
  delete "/log_out", to: "sessions#destroy"
  
  resources :users do
    resources :relationships, only: :index
  end
  resources :images do
    collection do
      match "search" => "images#search", via: [:get, :post], as: :search
    end
  end
  resources :relationships, only: [:create, :destroy]
end
