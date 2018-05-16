Rails.application.routes.draw do
  resources :employee_session_events
  resources :employee_sessions
  root 'welcome#index'

  post 'upload' => 'welcome#upload', :as => :upload
  resources :user_sessions
  resources :users

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
