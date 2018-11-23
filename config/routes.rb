Rails.application.routes.draw do
  post 'add', to: 'friendships#add'
  get 'friends', to: 'users#friends'
  get 'search_users', to: 'users#searchu'
  get 'user_stocks/create'
  devise_for :users
  root 'welcome#index'
  get 'welcome/index'
  get 'search_stock', to: 'stocks#search'
  get 'my_portfolio', to: 'users#my_portfolio'
  resources :user_stocks, only: %i[create destroy]
  resources :users, only: %i[show]
  resources :friendships, only: %i[destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
