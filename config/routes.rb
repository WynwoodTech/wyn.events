Rails.application.routes.draw do
  resources :events, only: [:index, :create]
  root to: 'public#index'
end
