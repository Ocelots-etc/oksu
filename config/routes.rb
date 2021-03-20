Rails.application.routes.draw do
  resources :appointments
  
  resources :admins
    get 'admin/login', to: 'sessions#new'
    post 'admin/login', to: 'sessions#create'

    get 'admin/signup', to: 'admins#new'
    post 'admin/signup', to: 'admins#create'

    

  resources :toolkits

  resources :users
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'

    get 'signup', to: 'users#new'
    post 'signup', to: 'users#create'

    get 'welcome', to: 'sessions#welcome', as: 'welcome'
    # get 'authorized', to: 'users#page_requires_login', as: 'authorized'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    post 'logout', to: 'sessions#destroy'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
