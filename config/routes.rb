Rails.application.routes.draw do

  root to: "books#index"

  resources :books
  resources :tags

  get '/filter_books', to: "books#index"
  post '/filter_books', to: "books#filter_books"

end
