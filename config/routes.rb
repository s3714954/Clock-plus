Rails.application.routes.draw do
  resources :categories, only: [ :index, :show ]
  resources :posts, except: [ :edit, :update, :destroy ]
  post '/posts/:id', to: 'comments#create'
  get 'sessions/new'
  get 'users/new'
      root  'static_pages#home'
      # get     '/help',      to: 'static_pages#help' # unrelated
      # get     '/about',     to: 'static_pages#about'
      # get     '/contact',   to: 'static_pages#contact'
      get     '/signup',    to: 'users#new'
      post    '/signup',    to: 'users#create'
      get     '/login',     to: 'sessions#new'
      post    '/login',     to: 'sessions#create'
      delete  '/logout',    to: 'sessions#destroy'
      resources :users   
      get '/posts/by/:id',   to: 'posts#user'
      get '/comments/by/:id', to: 'comments#index'
      get '/comments/to/:id', to: 'comments#to_user'
end
