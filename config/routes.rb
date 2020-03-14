Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks" }
  get "/books/most_recent_book", to: "books#most_recent_book"
  resources :books do
    resources :comments, only: [:index, :new, :edit, :show]
  end

  resources :comments

  get "/search", to: "search#results"
  
  
  root to: "home#page"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
