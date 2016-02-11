Chat::Engine.routes.draw do
  resources :conversations, only: [:index]
  resources :messages, only: [:create]
end
