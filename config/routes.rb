Chat::Engine.routes.draw do
  resources :conversations, only: [:index, :show] do
    member do
      post :mark_as_read
    end
  end
  resources :messages, only: [:create]
end
