Rails.application.routes.draw do
 
  
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users do
   member do
    get 'edit_basic_info'
    patch 'update_basic_info'
   end
   resources :attendances, only: :update
 end
end