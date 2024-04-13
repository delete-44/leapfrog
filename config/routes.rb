Rails.application.routes.draw do
  resources :games, except: %i[new]
  resources :nodes, only: %i[create edit update]
  resources :connections, only: %i[create]
  resources :players, only: %i[update]
  root "games#index"
end
