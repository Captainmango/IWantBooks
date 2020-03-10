Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :comments
  resources :books

  
  

  root to: "home#page"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
