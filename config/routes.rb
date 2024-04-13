Rails.application.routes.draw do
  resources :games, except: %i[new]
  root "games#index"
end
