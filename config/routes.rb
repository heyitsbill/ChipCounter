Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/', to: "users#index"
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete '/signout', to: "sessions#destroy"
  get '/create_account', to: "users#new"
  post '/create_account', to: "users#create"
  get '/menu', to: "users#menu"
end
