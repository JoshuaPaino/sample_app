Rails.application.routes.draw do
  get 'static_page/home' 
  get 'static_page/help'
  get 'static_page/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "static_page#home"
end
