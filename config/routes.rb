Rails.application.routes.draw do
  root to: "items#edit"
  resources :items, only:[:index, :edit, :new, :show]

end
