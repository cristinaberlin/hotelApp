Rails.application.routes.draw do
  devise_for :users

  # set route f my application to the home controller home action
  resources :hotels
  #get 'pages/home'
 # root 'pages#home'
  root to: 'home#home'

  #get 'pages/about'
  get 'about', to: 'hotels#about'


  #get '/about' => 'pages#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
