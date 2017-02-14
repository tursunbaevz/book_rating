Rails.application.routes.draw do
  root 'books#index'
  devise_for :users
  resources :books
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
