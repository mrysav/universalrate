Rails.application.routes.draw do
  root 'search#index'
  
  get '/login', :to => 'sessions#new', :as => :login
  get '/logout' => 'sessions#destroy', :as => :logout
  get "/auth/:provider/callback" => "sessions#create"
  
  resources :things, :except => :index
  post '/rate/:id' => 'things#rate'
  
  get '/search' => 'search#index'

end