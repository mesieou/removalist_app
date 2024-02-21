Rails.application.routes.draw do
  get 'items/index'
  devise_for :users
  root to: "pages#home"

  resources :booking do
    collection do
      get 'locations/new', to: 'locations#new', as: 'new_location'
      post 'locations/', to: 'locations#create', as: 'locations'
      get 'locations/:id/edit', to: 'locations#edit', as: :add_accesibility
      patch 'locations/:id', to: 'locations#update', as: :update_location
      get 'items/', to: 'items#index', as: 'items'
    end
  end
end
