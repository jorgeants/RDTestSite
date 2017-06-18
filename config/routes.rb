Rails.application.routes.draw do

	get '/home', to: 'pages#home'

	get '/pricing', to: 'pages#pricing'

	get '/about', to: 'pages#about'

	get '/contact', to: 'pages#contact'

	resource :messages, only: [:create]

	root to: 'pages#home'

end
