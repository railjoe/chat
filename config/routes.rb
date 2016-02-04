Chat::Engine.routes.draw do
  resources :conversation, only: [:index] do
    member do
      resources :messages
    end
  end
end
