Rails.application.routes.draw do
  root to: 'static_pages#home'

  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users do
    member do
      get :followings, :followers, :favorites, :retweets
    end
  end
  
  resources :microposts do
    resource :favorites, only: [:create, :destroy]
    resource :retweets, only: [:create, :destroy]
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  
end