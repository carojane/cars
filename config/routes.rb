Rails.application.routes.draw do
  get 'cars/index'

  get 'cars/new'

  get 'manufacturers/index'

  get 'manufacturers/new'

  resources :cars, only: [:index, :create, :new]
  resources :manufacturers, only: [:index, :create, :new]
  root 'welcome#index'
end
