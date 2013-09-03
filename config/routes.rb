AccAdultEd::Application.routes.draw do
  resources :users, :only => [:new, :create, :show]
  resource :session, :only => [:new, :create, :destroy]
  resources :locations
  resources :terms
  resources :courses
  resources :course_types
  resources :instructors
  resources :clients, :only => [:new, :create]
  resources :admins
  
  root :to => "users#show"
end