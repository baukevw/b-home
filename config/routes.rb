require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'pages#dashboard'
  get '/home', to: 'pages#index'
  get '/areas/:id', to: 'areas#show', as: :area
  resources :schedules

  post '/mqtt/publish', to: 'mqtt#publish'

  namespace :admin do
    resources :devices
    resources :rooms
    resources :areas
  end

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
