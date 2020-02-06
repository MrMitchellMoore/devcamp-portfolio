Rails.application.routes.draw do  
  
  # Independent routes
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  #Resources
  resources :blogs
  resources :portfolios

  root to: 'pages#home' 
end
