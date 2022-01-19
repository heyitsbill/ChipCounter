Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/', to: "sessions#index"
  get 'login', to: "sessions#new" 
  post 'login', to: "sessions#create"
  get '/create_account', to: "sessions#new_account"
  post '/create_account', to: "sessions#create_account"
  delete '/signout', to: "sessions#destroy"
  get '/menu', to: "users#menu"
  get '/create_room', to: "rooms#new"
  post '/create_room', to: "rooms#create"
  get '/join_room', to: "rooms#join"
  post '/join_room', to: "rooms#validate"
  get '/my_rooms', to: "rooms#my_rooms"
  get '/profile', to: "users#profile"
  get '/rooms/:id', to: "rooms#show"
end
