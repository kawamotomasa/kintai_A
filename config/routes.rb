Rails.application.routes.draw do
 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'arrival_users', to: 'users#arrival_users'
  get 'working',to: 'users#working'
  get 'bases', to: 'bases#index'
  get 'newbases', to: 'bases#new'
  post 'bases', to: 'bases#create'
  
  
  resources :bases, only:[:index,:update,:edit]
  
  resources :users do
   member do
    get 'edit_basic_info'
    patch 'update_basic_info'
    get 'edit_overwork_request'
    patch 'update_overwork_request'
    get 'attendances/edit_one_month'
    patch 'attendances/update_one_month'
    end
    
   resources :users, only: :index do
    collection { post :import }
   end
  
  resources :attendances, only: :update
  end
   
end