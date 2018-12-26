require 'sidekiq/web'

Rails.application.routes.draw do
  resources :areas
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'pages#index'

  mount Sidekiq::Web => '/sidekiq'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
