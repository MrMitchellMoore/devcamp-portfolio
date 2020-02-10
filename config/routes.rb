Rails.application.routes.draw do  
  
  # Auth routes  
  devise_for :users
  
  #Resources
  resources :portfolios, except: [:show]

  # Independent routes
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'angular-items', to: 'portfolios#angular'

  # Custom routes
  resources :blogs do
  	member do
  		get :toggle_status	
  	end
  end

  root to: 'pages#home' 
end
