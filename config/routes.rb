Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/booking/locations/new', to: 'locations#new', as: 'new_location'
  post '/booking/locations', to: 'locations#create', as: 'locations'

  resources :booking do
  end
end
