Rails.application.routes.draw do

  devise_for :users
  mount Chat::Engine => "/chat"
end
