
Rails.application.routes.draw do
  get "home/index"

  root "home#index"

get    "/signup", to: "users#new"
post   "/users",  to: "users#create"    # ← add this line

get    "/login",  to: "sessions#new"
post   "/login",  to: "sessions#create"
delete "/logout", to: "sessions#destroy"

resources :tasks, only: [:index, :create]

  
end
