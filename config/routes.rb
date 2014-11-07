ImageSpace::Application.routes.draw do
  resources :users
  resources :posts
  
  root    "home#index"
  get     'signup' => 'users#new'
  
  #RESTFUL actions for login
  get     'login' => "sessions#new"
  post    'login' => "sessions#create"
  delete  'logout' => "sessions#destroy"
end
