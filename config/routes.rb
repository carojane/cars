Rails.application.routes.draw do
  resources :cars, only: [:index, :create, :new]
  resources :manufacturers, only: [:index, :create, :new]
  root 'welcome#index'
end
