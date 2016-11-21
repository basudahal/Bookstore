Rails.application.routes.draw do
  resources :genres
	resource :session
	  get "signin" => "sessions#new"
	  get 'signup' => 'users#new'
	  resources :users

  root "books#index"
	resources :books do
  		resources :reviews
   		resources :favorites
  	end
end
