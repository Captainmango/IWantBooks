Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks" }
 
  resources :books do
    resources :comments, only: [:index, :new, :edit, :show]
  end

  resources :comments

  get "/search", to: "search#results"
  
  root to: "home#page"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
