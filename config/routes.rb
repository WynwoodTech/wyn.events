Rails.application.routes.draw do
  resources :events, only: [:index, :create, :show, :update], defaults: { format: :json }
  root to: 'public#index'
end
