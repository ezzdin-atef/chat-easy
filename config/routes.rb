Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "applications" => "applications#index"
  post "applications" => "applications#create"
  put "applications/:token" => "applications#update"

  post "chats" => "chats#create"
  post "messages" => "messages#create"

  get "applications/:token/chats" => "chats#getApplicationChats"
  get "applications/:token/:chat_number/messages" => "messages#getChatMessages"
  get "applications/:token/:chat_number/messages/search" => "messages#searchMessage"
end
