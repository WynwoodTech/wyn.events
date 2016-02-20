Rails.application.routes.draw do

  get 'events' => 'events#index'
  post 'events' => 'events#create'

end
