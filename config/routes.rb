Rails.application.routes.draw do
  get 'accesibilities/new'
  get 'accesibilities/create'
  devise_for :users
  root to: "pages#home"
  # get '/booking/locations/new', to: 'locations#new', as: 'new_location'
  # post '/booking/locations', to: 'locations#create', as: 'locations'

  resources :booking do
    collection do
      get 'locations/new', to: 'locations#new', as: 'new_location'
      post 'locations/', to: 'locations#create', as: 'locations'
      get 'locations/:id/edit', to: 'locations#edit', as: :add_accesibility
      patch 'locations/:id', to: 'locations#update', as: :update_location
    end
  end
end
