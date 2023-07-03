Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :stories, only: [:new, :show]
  
  get 'stories', to: 'stories#show'
  root 'tops#top'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout' , to: 'sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
end
