Rails.application.routes.draw do
  resources :appointments
  
  namespace :admins do 
    resources :appointments
    resources :users do
      resource :toolkit, except: :destroy
    end
  end

  resources :admins 

  get 'admin/login', to: 'sessions#new'
  post 'admin/login', to: 'sessions#create'

  get 'admin/signup', to: 'admins#new'
  post 'admin/signup', to: 'admins#create'

  get 'admin/dashboard', to: 'admins#dashboard'

  resource :toolkit

  resource :user, except: :destroy
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get 'welcome', to: 'sessions#welcome', as: 'welcome'

  get 'logout', to: 'sessions#destroy', as: 'logout'
  post 'logout', to: 'sessions#destroy'

  get 'dashboard', to: 'users#show'

  get '/auth/:provider/callback', to: "sessions#omniauth" 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
