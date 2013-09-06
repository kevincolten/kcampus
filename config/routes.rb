AccAdultEd::Application.routes.draw do
  
  resources :clients, :only => [:new, :create]
  resources :users, :only => [:new, :create, :show]
  resource :session, :only => [:new, :create, :destroy]
  resources :locations
  resources :course_types
  resources :instructors
  resources :admins
  resources :students, :only => [:index, :show]
  
  resources :terms do 
    resources :courses
    resources :course_regs
    resources :events
    resources :event_regs
    resources :attendance_records
  end
  
  resource :term_toggler
  
  root :to => "users#show"
  
end