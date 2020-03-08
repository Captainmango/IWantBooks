Rails.application.routes.draw do
  #devise_for :users
  resources :comments
  resources :books

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  

  root to: "home#page"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
