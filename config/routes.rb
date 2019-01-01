require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'pages#index'
  get '/dashboard', to: 'pages#dashboard'
  get '/areas/:id', to: 'areas#show', as: :area

  namespace :admin do
    resources :devices
    resources :rooms
    resources :areas
  end

  mount Sidekiq::Web => '/sidekiq'
  mount Bhome::API => '/'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
