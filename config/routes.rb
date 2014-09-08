Rails.application.routes.draw do
  root 'welcome#index'
  
  get '/login', :to => 'sessions#new', :as => :login
  get '/logout' => 'sessions#destroy', :as => :logout
  get "/auth/:provider/callback" => "sessions#create"

end