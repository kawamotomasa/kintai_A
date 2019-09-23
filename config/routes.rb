Rails.application.routes.draw do
 
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'bases', to: 'users#bases'
  get 'arrival_users', to: 'users#arrival_users'
  
  resources :users do
   member do
    get 'edit_basic_info'
    patch 'update_basic_info'
    get 'attendances/edit_one_month'
    patch 'attendances/update_one_month'
    get 'edit_overwork_request'
    patch 'update_overwork_request'
    
   end
   resources :attendances, only: :update
end
   resources :users do
    collection do
    post :import
    end
  end
end