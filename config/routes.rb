Rails.application.routes.draw do
  resources :homes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'board#index'

  get '/boards' => 'board#index'
  get '/boards/new' => 'board#new'
  post '/boards' => 'board#create'
  get '/boards/:id/edit' => 'board#edit'
  get '/boards/:id' => 'board#show'
  post '/boards/:id' => 'board#update'
  delete '/boards/:id' => 'board#destroy'

  get '/signin' => 'session#signin'
  post '/user_signin' => 'session#user_signin'
  get '/signup' => 'session#signup'
  post '/user_signup' => 'session#user_signup'
  delete '/logout' => 'session#logout'
  
end
