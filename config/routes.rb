Rails.application.routes.draw do  
  
  # resources :comments
  # Auth routes  
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'} 
  
  #Resources
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end

  # Independent routes
  get 'about-me', to: 'pages#about'
  
  get 'contact', to: 'pages#contact'

  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'angular-items', to: 'portfolios#angular'

  get 'tech-news', to: 'pages#tech_news'

  # Custom routes
  resources :blogs do
  	member do
  		get :toggle_status	
  	end
  end

  # Action cable server
  mount ActionCable.server => '/cable'

  # root path
  root to: 'pages#home' 
end
