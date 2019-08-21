Rails.application.routes.draw do
 
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users do
   member do
    get 'edit_basic_info'
    patch 'update_basic_info'
    get 'attendances/edit_one_month'
    patch 'attendances/update_one_month'
   end
   resources :attendances, only: :update
   end
   resources 'objects', only: :index do
   collection { post :import }
  end
end