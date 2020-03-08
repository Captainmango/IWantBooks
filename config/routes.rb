Rails.application.routes.draw do
  devise_for :users
  resources :comments
  resources :books
  resources :users

  root to: "home#page"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
