Rails.application.routes.draw do

  root 'books#index'
  resources :books do
    resources :reviews
  end
  devise_for :users
  resources :categories
  resources :authors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
