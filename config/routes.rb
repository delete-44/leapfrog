Rails.application.routes.draw do
  resources :games
  root "games#index"
  resources :games, only: %i[index]
end
