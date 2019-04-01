require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'main#index'
  mount Sidekiq::Web => '/sidekiq'

  resources :alarms, only: :create do
    member do
      patch :upvote
    end
  end
end
