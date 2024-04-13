Rails.application.routes.draw do
  resources :games, except: %i[new]
  resources :nodes, only: %i[create edit update]
  resources :connections, only: %i[create]
  root "games#index"
end
