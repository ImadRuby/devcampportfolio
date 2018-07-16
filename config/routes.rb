Rails.application.routes.draw do
	#givme all path for portfolios, except for the method "show" because i want a different route.
  resources :portfolios, except: [:show]
  	#this is the route i want (portfolio in singular)
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'angular-items', to: 'portfolios#angular'

  resources :blogs do
  	member do
  		get :toggle_status
  	end
  end
  

  root to: 'pages#home'
  
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
end
