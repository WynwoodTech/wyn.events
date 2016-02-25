Rails.application.routes.draw do
  resources :events, only: [:index, :create], defaults: { format: :json }
  root to: 'public#index'
end
