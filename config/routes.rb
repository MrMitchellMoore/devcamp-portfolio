Rails.application.routes.draw do  
  
  #Resources
  resources :blogs
  resources :portfolios, except: [:show]

  # Independent routes
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  root to: 'pages#home' 
end
