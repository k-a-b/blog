Rails.application.routes.draw do

  resources :users
  resources :messages
  resources :sessions
  root 'main#index'
  get 'log_in', to: 'sessions#new'
  post 'log_in', to: 'sessions#create'
  get 'log_out', to: 'sessions#destroy'
  get 'sing_up', to: 'users#new'
  get 'main', to: 'main#index'
  get 'messages/page/(:page(.:format))', to: 'messages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
