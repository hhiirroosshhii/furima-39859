Rails.application.routes.draw do
  devise_for :users
  root to: "items#edit"
  resources :items


end
