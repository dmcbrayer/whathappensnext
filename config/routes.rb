Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  devise_for :users

  root to: 'static_pages#home'

  get '/about', to: 'static_pages#about'
end
