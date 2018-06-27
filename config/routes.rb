Rails.application.routes.draw do
	#givme all path for portfolios, except for the method "show" because i want a different route.
  resources :portfolios, except: [:show]
  	#this is the nroute i want (portfolio in singular)
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  resources :blogs
  

  root to: 'pages#home'
  
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
end
