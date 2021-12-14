Rails.application.routes.draw do
  

  
  root 'users#index'
  get '/dashboard' => 'dashboard#index'
  get '/logout' => 'dashboard#logout'
  get '/user_personal_details' => 'users#index'
  resources :users
  resources :fulldetails

  post "fulldetails/:id", to: "fulldetails#update"
  get 'authorized', to: 'fulldetails#page_requires_login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/login', to: 'users#login'
  get '/dashboard', to: 'users#dashboard'
  get '/set_personal_details', to: 'fulldetails#set_personal_details'
  get '/show', to: 'users#show'

  namespace :api do
    namespace :v1 do
      get 'index', to: 'demo#index'
    end
  end

end
