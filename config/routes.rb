Rails.application.routes.draw do
  devise_for :users,
             controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root "rooms#new"
  get "rooms/:number", to: "rooms#show", as: "room"
  get "rooms/:number/join", to: "join#new", as: "join_room"
  resources :rooms, only: %i[show create update destroy] do
  end
end
