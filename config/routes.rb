Rails.application.routes.draw do
  get 'sessions/new'
  get 'items/index'
 
  get 'home/search' => 'home#search'
  get 'home/search' => 'home#keyword'
  get 'home/toparea' => 'home#show'

  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"

  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

  get "items/new/:id" => "items#new"
  post "items/create" => "items#create"
  get "items/:id/show" => "items#show"
  get "items/:id/edit" => "items#edit"
  post "items/:id/update" => "items#update"
  post "items/:id/destroy" => "items#destroy"

  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'


  get "/" => "home#index"

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :posts
  resources :items
end
