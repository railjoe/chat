Chat::Engine.routes.draw do
  resources :conversations, only: [:index, :show]
  resources :messages, only: [:create]
end
