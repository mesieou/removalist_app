Rails.application.routes.draw do
  get 'items/index'
  get 'bookings/available', to: 'bookings#available', as: 'available'

  devise_for :users
  root to: "pages#home"
  get 'pages/options', to: 'pages#options', as: 'options'
  resources :booking do
    collection do
      get 'locations/new', to: 'locations#new', as: 'new_location'
      post 'locations/', to: 'locations#create', as: 'locations'
      get 'locations/:id/edit', to: 'locations#edit', as: :add_accesibility
      patch 'locations/:id', to: 'locations#update', as: :update_location
      get 'items/', to: 'items#index', as: 'items'
      post 'items/', to: 'items#create'
    end
  end
end
