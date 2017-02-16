Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get 'test/index'

  root 'books#index'
  devise_for :users
  resources :books do
  	resources :reviews
  end
  resources :categories
  resources :authors
  get 'test', to: 'test#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
