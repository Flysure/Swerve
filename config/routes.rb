Rails.application.routes.draw do
  root 'welcome#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :users
  resources :potholes
  post '/locate', to: 'potholes#locate'
  post '/bounds', to: 'potholes#bounds'
  post '/home', to: 'potholes#home'
end
