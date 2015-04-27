Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  devise_for :users

  resources :stories do
    resources :posts, only: [:create, :edit, :update, :destroy]
  end

  root to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
end
