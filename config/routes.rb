Rails.application.routes.draw do
  get 'user_stocks/create'
  devise_for :users
  root 'welcome#index'
  get 'welcome/index'
  get 'search_stock', to: 'stocks#search'
  get 'my_portfolio', to: 'users#my_portfolio'
  resources :user_stocks, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
