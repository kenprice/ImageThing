ImageSpace::Application.routes.draw do
  resources :users
  resources :posts
  
  root    "home#index"
  get     'signup' => 'users#new'

  scope :path => "users/:id/front", :as => "front" do
    get "/" => 'users#front'
  end

  scope :path => "posts/:id/brightness", :as => "brightness" do
    get "/" => 'posts#brightness'
    patch "/" => 'posts#update_brightness'
  end

  #RESTful actions for login
  get     'login' => "sessions#new"
  post    'login' => "sessions#create"
  get     'logout' => "sessions#logout"
  delete  'logout' => "sessions#destroy"
end
