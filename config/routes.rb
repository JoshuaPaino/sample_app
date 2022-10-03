Rails.application.routes.draw do
  root "static_page#home"
  get  "/help",    to: "static_page#help"
  get  "/about",   to: "static_page#about"
  get  "/contact", to: "static_page#contact"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
end
