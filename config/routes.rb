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
      get 'accesibilities/new', to: 'accesibilities#new', as: :new_accesibility
      post 'accesibilities/', to: 'accesibilities#create'
    end
  end
end
