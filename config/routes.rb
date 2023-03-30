Rails.application.routes.draw do
  devise_for :users
  root "rooms#new"
  get "rooms/:number", to: "rooms#show", as: "room"
  resources :rooms, only: %i[show create update destroy] do
  end
end
