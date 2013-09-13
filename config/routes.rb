AccAdultEd::Application.routes.draw do
  
  resources :password_resets

  resources :clients, :only => [:new, :create]
  resources :users, :only => [:new, :create, :show]
  resource :session, :only => [:new, :create, :destroy]
  resources :locations
  resources :course_types
  resources :instructors
  resources :admins
  resources :students, :only => [:index, :show] do
    collection { post :import }
  end
  resources :courses
  resources :course_regs
  resources :events
  resources :event_regs
  resources :attendance_records
  resource :term_toggler
  resource :attendance_export
  resources :terms
  
  root :to => "courses#index"
  
end