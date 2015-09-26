Rails.application.routes.draw do
  
  resources :pages
  resources :announcements
  resources :categories
  resources :posts
  get '/dashboard', to: 'pages#dashboard'
  devise_for :users, :path => '', path_names:
  {sign_in:'login', sign_out: 'logout', sign_up:'signup'}
  root to:'pages#index'
end
