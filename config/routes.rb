Rails.application.routes.draw do
  resources :games, except: %i[new]
  resources :nodes, only: %i[create edit update]
  root "games#index"
end
