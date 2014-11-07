ImageSpace::Application.routes.draw do
  resources :users
  resources :posts
  
  root    "home#index"
  get     'signup' => 'users#new'

  scope :path => "users/:id/front", :as => "front" do
  	get "/" => 'users#front'
  end

  #RESTful actions for login
  get     'login' => "sessions#new"
  post    'login' => "sessions#create"
  delete  'logout' => "sessions#destroy"
end
