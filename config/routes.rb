Rails.application.routes.draw do

  get 'pages/home'

  get 'pages/pricing'

  get 'pages/about'

  get 'pages/contact'

	root to: 'application#index'

end
