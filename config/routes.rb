Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/booking/locations/new', to: 'locations#new', as: 'new_location'

  resources :booking do
  end
end
