Rails.application.routes.draw do
  post "user/create"
  post "login" => "sessions#create"
  post "logout" => "user#logout"
  post "user/:id/update" => "user#update"
  post "user/:id/profileupdate" => "user#profileupdate"
  
  post "room/create"
  post "rooms/" => "room#rooms"
  post "room/reserve"
  post "room/complete"
  
  get "/" => "home#index"
  
  get "room" => "room#rooms"
  get "room/:id/show" => "room#show"
  get "room/reserve"
  get "room/complete"
  get "room/new"
  get "rooms" => "room#rooms"
  get "room/search"
  get "room/complete"

  get "login" => "sessions#login"
  get "logout" => "user#logout"
  get "user/:id/account" => "user#account"
  get "user/:id/profile" => "user#profile"
  get "user/:id/edit" => "user#edit"
  get "new" => "user#new"
  get "user/:id/createroom/" => "user#createroom"
  get "user/:id/reserveroom" => "user#reserveroom"
  
  resources :user
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
