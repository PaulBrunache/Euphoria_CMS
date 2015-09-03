Rails.application.routes.draw do
  resources :roles
  devise_for :users, controllers: {
        sessions: 'users/sessions'
        
  }
  root 'welcome#index'
end
