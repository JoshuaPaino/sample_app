Rails.application.routes.draw do
  get 'sessions/new'
  root "static_page#home"
  get  "/help",    to: "static_page#help"
  get  "/about",   to: "static_page#about"
  get  "/contact", to: "static_page#contact"
  get "signup", to: "users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
end
