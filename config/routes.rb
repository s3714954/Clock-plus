Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root  'static_pages#home'
  post 'cities/', to: 'cities#toggle'
  patch 'cities/:id', to: 'cities#toggle', as: :city
end
